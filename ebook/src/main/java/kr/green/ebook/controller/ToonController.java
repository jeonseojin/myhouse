package kr.green.ebook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.service.ToonService;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.ClaimVo;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.MemberVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;

@Controller
public class ToonController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
	@Autowired
	ToonService toonService;
	@Autowired
	AdminDao adminDao;
	
	@RequestMapping(value = "/toon", method = RequestMethod.GET)
	public ModelAndView toon(ModelAndView mv, Criteria cri) {
		mv.setViewName("/toon/week");
		ArrayList<ToonVo> wlist = toonService.weekList(cri);
		mv.addObject("wlist", wlist);
		PageMaker pm = adminService.getPageMakerByToon(cri);
		mv.addObject("pm", pm);
		return mv;
	}
	@RequestMapping(value = "/toon/ep", method = RequestMethod.GET)
	public ModelAndView toonEp(ModelAndView mv,String Title, Criteria cri,HttpServletRequest r,ChoiceVo ch) {
		mv.setViewName("/toon/ep");
		//조회수 및 웹툰정보
		ToonVo toon = toonService.view(Title);
		mv.addObject("toon", toon);
		//연재웹툰
		ArrayList<EpisodeVo> epcov = toonService.getEpcoverlist(Title);
		mv.addObject("epcov", epcov);
		//페이지네이션
		PageMaker pm = adminService.getPageMakerByToon(cri);
		mv.addObject("pm", pm);
		//찜
		MemberVo member = memberService.getMember(r);
		ArrayList<PayVo> plist=null;
		if(member!=null) {
			ch = toonService.getChoice(Title,member.getId());
			//충전
			plist = toonService.getPayList(member.getName());
		}
		mv.addObject("ch", ch);
		mv.addObject("plist", plist);
		return mv;
	}
	@RequestMapping(value = "/toon/comic", method = RequestMethod.GET)
	public ModelAndView toonComic(ModelAndView mv, String Title, String edition) {
		mv.setViewName("/toon/comic");
		//웹툰불러오기
		ArrayList<EpisodeVo> eplist = toonService.getEpList(Title,edition);
		mv.addObject("eplist", eplist);
		//댓글전체보기
		ArrayList<EpcommentVo> cmtlist = toonService.getCmtList(Title,edition);
		mv.addObject("cmtlist", cmtlist);
		//전체댓글수
		int cmtnum = cmtlist.size();
		mv.addObject("cmtnum", cmtnum);
		//제목불러오기용
		EpisodeVo epcov = toonService.getEp(Title,edition);
		mv.addObject("epcov", epcov);
		return mv;
	}
	//한개 구매
	@RequestMapping(value = "/toon/comic", produces="application/json; charset=utf8")
	@ResponseBody
	public Map<Object, Object> toonComicPost(@RequestBody PayVo pay,HttpServletRequest r) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		MemberVo member = memberService.getMember(r);
		pay.setP_member(member.getName());
		ArrayList<PayVo> plist = toonService.getPayList(member.getName());
		String str="";
		for(int i=0;i<plist.size();i++) {
			if(plist.get(i).getP_title()==null&& plist.get(i).getP_title()!=pay.getP_title()) {
				str="Y";
			}else {
				str="N";
			}
		}
		pay.setP_one(str);
		if(member.getCoin()==0||member.getCoin()==1) {
			map.put("res","보유하고 계신 코인이 부족합니다.");
		}else {
			adminService.insertPay(pay);
			member.setCoin(member.getCoin()-pay.getP_coin());
			memberService.updatecoin(member);
			map.put("url", r.getContextPath()+"/toon/comic?Title="+pay.getP_title()+"&edition="+pay.getP_edition());
		}
		return map;
	}

	//웹툰 댓글 등록
	@RequestMapping(value = "/toon/comment", produces="application/json; charset=utf8")
	@ResponseBody
	public Map<Object, Object> addComment(@RequestBody EpcommentVo epcmt) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		toonService.insertEpcmt(epcmt);
		ArrayList<EpcommentVo> cmtlist = toonService.getCmtList(epcmt.getCo_epTitle(), epcmt.getCo_epEdition());
		map.put("cmtlist",cmtlist);
		map.put("member",epcmt.getCo_member());
		return map;
	}
	//찜하기
	@RequestMapping(value = "/toon/choice", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> toonChoice(@RequestBody String Title, HttpServletRequest r) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		//현재 로그인 중인 유저 정보
		MemberVo member =memberService.getMember(r);
		if(member==null)
			map.put("isMember",false);
		else {
			map.put("isMember",true);
			int choice = toonService.updateChoice(Title,member.getId());
			map.put("choice",choice);
		}
		return map;
	}
	//찜취소
	@RequestMapping(value = "/toon/nochoice", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> toonChoiceno(@RequestBody String Title, HttpServletRequest r) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		//현재 로그인 중인 유저 정보
		MemberVo member =memberService.getMember(r);
		if(member==null)
			map.put("isMember",false);
		else {
			map.put("isMember",true);
			int choice = toonService.deleteChoice(Title,member.getId());
			map.put("choice",choice);
		}
		return map;
	}
	
	//문의 페이지
	@RequestMapping(value = "/toon/help", method = RequestMethod.GET)
	public ModelAndView toomclaim(ModelAndView mv, Criteria cri){
		mv.setViewName("/toon/claim");
		ArrayList<ClaimVo> cl =adminService.getClaim(cri);
		mv.addObject("cl", cl);
		return mv;
	}
}
