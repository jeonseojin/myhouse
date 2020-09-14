package kr.green.ebook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.service.ToonService;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.MemberVo;
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
	
	//연재 페이지
	@RequestMapping(value = "/toon", method = RequestMethod.GET)
	public ModelAndView toon(ModelAndView mv, Criteria cri) {
		mv.setViewName("/toon/week");
		ArrayList<ToonVo> wlist = toonService.weekList(cri);
		mv.addObject("wlist", wlist);
		PageMaker pm = adminService.getPageMakerByToon(cri);
		mv.addObject("pm", pm);
		return mv;
	}
	//작품+연재페이지
	@RequestMapping(value = "/toon/ep", method = RequestMethod.GET)
	public ModelAndView toonEp(ModelAndView mv,String Title, Criteria cri,HttpServletRequest r,ChoiceVo ch) {
		mv.setViewName("/toon/ep");
		ToonVo toon = toonService.view(Title);
		mv.addObject("toon", toon);
		ArrayList<EpisodeVo> epcov = toonService.getEpcoverlist(Title);
		mv.addObject("epcov", epcov);
		PageMaker pm = adminService.getPageMakerByToon(cri);
		mv.addObject("pm", pm);
		MemberVo member = memberService.getMember(r);
		if(member!=null) {
			ch = toonService.getChoice(Title,member.getId());
		}
		mv.addObject("ch", ch);
		return mv;
	}
	//웹툰페이지
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
	//웹툰 댓글 등록
	@RequestMapping(value = "/toon/comment", produces="application/json; charset=utf8")
	@ResponseBody
	public Map<Object, Object> addComment(@RequestBody EpcommentVo epcmt) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		toonService.insertEpcmt(epcmt);
		ArrayList<EpcommentVo> cmtlist = toonService.getCmtList(epcmt.getCo_epTitle(), epcmt.getCo_epEdition());
		map.put("cmtlist",cmtlist);
		System.out.println(cmtlist);
		return map;
	}
	//찜등록
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
	//찜해제
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
}