package kr.green.ebook.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.service.ToonService;
import kr.green.ebook.utils.UploadFileUtils;
import kr.green.ebook.vo.BookeventVo;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.ClaimVo;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.GenreVo;
import kr.green.ebook.vo.MemberVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;
import kr.green.ebook.vo.UpVo;

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
	
	private String uploadPath = "D:\\JAVA\\spring\\myhouse\\ebook\\src\\main\\webapp\\resources\\img";
	
	
	//연재연결
		@RequestMapping(value = "/toon", method = RequestMethod.GET)
		public ModelAndView toon(ModelAndView mv, Criteria cri) {
			mv.setViewName("/toon/week");
			ArrayList<ToonVo> wlist = toonService.weekList(cri);
			mv.addObject("wlist", wlist);
			PageMaker pm = adminService.getPageMakerByToon(cri);
			mv.addObject("pm", pm);
			return mv;
		}
		//작품 상세페이지
			@RequestMapping(value = "/toon/ep", method = RequestMethod.GET)
			public ModelAndView toonEp(ModelAndView mv,String Title, Criteria cri,HttpServletRequest r,ChoiceVo ch,UpVo up,HttpServletResponse rs) {
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
					up = toonService.getUp(Title,member.getId());
					//충전한 경우/안한경우
					plist = toonService.getPayList(member.getId());
					Cookie[] cook = r.getCookies();
					Cookie cookie = new Cookie(Title,Title);
					cookie.setMaxAge(60*5);
					cookie.setPath("/");
					rs.addCookie(cookie);
				}			
				mv.addObject("ch", ch);
				mv.addObject("up", up);
				mv.addObject("plist", plist);
				return mv;
			}
		//좋아요 증가
			@RequestMapping(value ="/toon/up", method=RequestMethod.POST)
			@ResponseBody
			public Map<Object, Object> ToonUp(@RequestBody String Title, HttpServletRequest r){
			    Map<Object, Object> map = new HashMap<Object, Object>();
			    //현재 로그인 중인 유저 정보
			    MemberVo member = memberService.getMember(r);
			    if(member == null) {
			    	map.put("isMember",false);
			    }else {
			    	map.put("isMember",true);
			    	int up = toonService.updateUp(Title, member.getId());
			    	map.put("up",up);
			    }
			    return map;
			}
		//만화연결
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
			pay.setP_member(member.getId());
			ArrayList<PayVo> plist = toonService.getPayList(member.getId());
			String str="Y";
			for(int i=0;i<plist.size();i++) {
				if(pay.getP_title().equals(plist.get(i).getP_title())) {
					str="N";
					break;
				}
			}
			pay.setP_one(str);
			if(member.getCoin()==0||member.getCoin()==1) {
				map.put("res","보유하고 계신 코인이 부족합니다.");
			}else {
				adminService.insertPay(pay);
				member.setCoin(member.getCoin()-pay.getP_coin());
				memberService.updatecoin(member);
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
			ArrayList<ClaimVo> answer = new ArrayList<ClaimVo>();
			for (int j = 0; j < cl.size(); j++) {
				if(cl.get(j).getCl_answer()!=0) {
					ClaimVo c = adminService.getClaimAnswer(cl.get(j).getCl_num());
					if(c!=null) {
						answer.add(c);
					}
				}
			}
			mv.addObject("answer", answer);
			return mv;
		}
		//문의 등록
		@RequestMapping(value = "/toon/help", method = RequestMethod.POST)
		public ModelAndView toomclaimP(ModelAndView mv, Criteria cri,ClaimVo cl,MultipartFile file2) throws IOException, Exception{
			mv.setViewName("redirect:/toon/help");
			cl.setCl_content(cl.getCl_content().replaceAll("\n", "<br>"));
			String cl_file="";
			if(file2!=null) {
				cl_file = UploadFileUtils.uploadFile(uploadPath,"\\"+cl.getCl_type(), file2.getOriginalFilename(), file2.getBytes());
				cl.setCl_file(cl_file);
			}
			adminService.insertclaim(cl);
			return mv;
		}
		
		//랭킹 연결
		@RequestMapping(value = "/ranking", method = RequestMethod.GET)
		public ModelAndView ranking(ModelAndView mv, Criteria cri) {
			mv.setViewName("/type/rank");
			ArrayList<ToonVo> toon = toonService.genreRank(cri);
			mv.addObject("toon", toon);
			return mv;
		}
		//ajax을 통해서 랭킹 변경하기
		@RequestMapping(value = "/ranking", produces="application/json; charset=utf8")
		@ResponseBody
		public Map<Object, Object> rankingajax(@RequestBody String genre, Criteria cri) {
			Map<Object, Object> map = new HashMap<Object, Object>();
			cri.setGenre(genre);
			ArrayList<ToonVo> toon = toonService.genreRank(cri);
			map.put("toon", toon);
			return map;
		}
		//이벤트 연결
		@RequestMapping(value = "/event", method = RequestMethod.GET)
		public ModelAndView event(ModelAndView mv, Criteria cri) {
			mv.setViewName("/event/home");
			ArrayList<BookeventVo> evlist = adminService.eventList(cri);
			mv.addObject("evlist", evlist);
			return mv;
		}
		//출석이벤트
		@RequestMapping(value = "/event/attend", method = RequestMethod.GET)
		public ModelAndView eventdetail(ModelAndView mv,String title, Criteria cri) {
			mv.setViewName("/event/attend");
			BookeventVo event = adminService.getEvent(title);
			mv.addObject("event", event);
			return mv;
		}
		//ajax을 통해서 출석
		@RequestMapping(value = "/event/attend", produces="application/json; charset=utf8")
		@ResponseBody
		public Map<Object, Object> attendajax(@RequestBody PayVo pay, Criteria cri, HttpServletRequest r) {
			Map<Object, Object> map = new HashMap<Object, Object>();
			//현재 로그인 중인 유저 정보
			MemberVo member =memberService.getMember(r);
			if(member==null) {
				map.put("isMember",false);
			}
			else {
				map.put("isMember",true);
				pay.setP_member(member.getId());
				PayVo p =adminService.payattend(pay);
				if(p==null) {
					member.setCoin(member.getCoin()+pay.getP_point());
					pay.setP_title("출석이벤트");
					adminService.insertPay(pay);
					memberService.updatecoin(member);
				}else {
					map.put("res", "이미 출석체크를 완료하였습니다.");
				}
			}
			return map;
		}
		
		//완결
		@RequestMapping(value = "/end", method = RequestMethod.GET)
		public ModelAndView theend(ModelAndView mv,Criteria cri) {
			mv.setViewName("/type/theend");
			ArrayList<GenreVo> genre = toonService.getGenrelist(cri);
			mv.addObject("genre", genre);
			ArrayList<ToonVo> toon = toonService.TheendGenre(cri);
			mv.addObject("toon", toon);
			return mv;
		}
		//ajax을 통해서 랭킹 변경하기
			@RequestMapping(value = "/end", produces="application/json; charset=utf8")
			@ResponseBody
			public Map<Object, Object> theendajax(@RequestBody String genre, Criteria cri) {
				Map<Object, Object> map = new HashMap<Object, Object>();
				cri.setGenre(genre);
				ArrayList<ToonVo> toon = toonService.TheendGenre(cri);
				map.put("toon", toon);
				return map;
			}
}
