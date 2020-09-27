package kr.green.ebook.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.service.ToonService;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.BookeventVo;
import kr.green.ebook.vo.MemberVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
	@Autowired
	ToonService toonService;
	
	//기본홈
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public ModelAndView home(ModelAndView mv, Criteria cri,HttpServletRequest r) {
			mv.setViewName("/main/home");
			ArrayList<ToonVo> tlist = adminService.toonList(cri);
			mv.addObject("tlist", tlist);
			ArrayList<ToonVo> uprank = adminService.toonRanking(cri);
			mv.addObject("uprank", uprank);
			ArrayList<ToonVo> viewrank = adminService.toonRankviews(cri);
			mv.addObject("viewrank", viewrank);
			MemberVo member = memberService.getMember(r);
			SimpleDateFormat nowTime = new SimpleDateFormat ( "yyyy-MM-dd");
			String now = nowTime.format (System.currentTimeMillis());
			adminService.getPay(now);
				
			ArrayList<BookeventVo> evlist = adminService.eventList(cri);
			mv.addObject("evlist", evlist);
			return mv;
		}

		// 로그인 동작
		@RequestMapping(value = "/signin", method = RequestMethod.GET)
		public ModelAndView signin(ModelAndView mv) {
			mv.setViewName("/main/signin");
			return mv;
		}
		@RequestMapping(value = "/signin", method = RequestMethod.POST)
		public ModelAndView signin(ModelAndView mv, MemberVo member) {
			MemberVo dbMember = memberService.isMember(member);
			if(dbMember != null) {//성공
				mv.setViewName("redirect:/");
				mv.addObject("member", dbMember);
			}else {//실패
				mv.setViewName("redirect:/signup");
			}
			return mv;
		}
		@RequestMapping(value = "/common/signin", method = RequestMethod.POST)
		public ModelAndView hSignin(ModelAndView mv, MemberVo member) {
			MemberVo dbMember = memberService.isMember(member);
			if(dbMember != null) {//성공
				mv.setViewName("redirect:/");
				mv.addObject("member", dbMember);
			}else {//실패
				mv.setViewName("redirect:/signin");
			}
			return mv;
		}
		
		//로그아웃
		@RequestMapping(value = "/signout", method = RequestMethod.GET)
		public ModelAndView signout(ModelAndView mv, HttpServletRequest r) {
			mv.setViewName("redirect:/");
			r.getSession().removeAttribute("member");
			return mv;
		}
		
		//회원가입 화면
		@RequestMapping(value = "/signup", method = RequestMethod.GET)
		public ModelAndView signup(ModelAndView mv) {
			mv.setViewName("/main/signup");
			return mv;
		}
		// 회원가입 정보 전송
		@RequestMapping(value = "/signup", method = RequestMethod.POST)
		public ModelAndView signupPost(ModelAndView mv, MemberVo member) {
			if(memberService.signup(member)) {//실패
				mv.setViewName("redirect:/signup");
			}else {//성공
				mv.setViewName("redirect:/");
				mv.addObject("member", member);
			}
			return mv;
		}
		
		//아이디 중복 확인
		@RequestMapping(value ="/idCheck")
		@ResponseBody
		public Map<Object, Object> idcheck(@RequestBody String id){
		    Map<Object, Object> map = new HashMap<Object, Object>();
		    map.put("res",memberService.getMember(id)==null);
		    return map;
		}
		//이름 중복 확인
		@RequestMapping(value ="/nameCheck")
		@ResponseBody
		public Map<Object, Object> namecheck(@RequestBody String name){
		    Map<Object, Object> map = new HashMap<Object, Object>();
		    map.put("res",memberService.getMemberName(name)==null);
		    return map;
		}
		//내서재 화면
		@RequestMapping(value = "/mybook", method = RequestMethod.GET)
		public ModelAndView mybook(ModelAndView mv, HttpServletRequest r,Criteria cri,HttpServletResponse rs) {
			mv.setViewName("/main/mybook");
			MemberVo member = memberService.getMember(r);
			if(member!=null) {
				ArrayList<ChoiceVo> chlist = memberService.getChoiceList(member.getId());
				mv.addObject("chlist", chlist);
				ArrayList<ToonVo> payToon = toonService.getPayToon(member.getId());
				mv.addObject("payToon", payToon);
				Cookie cook[] = r.getCookies();
				ArrayList<ToonVo> toon = new ArrayList<ToonVo>();
				
				for (int i = 0; i < cook.length; i++) {
					if(!cook[i].getName().equals("JSESSIONID")) {
						ToonVo t = adminService.getToonT(cook[i].getValue());
						toon.add(t);
					}
				}
				mv.addObject("toon",toon);
			}
			
			
			return mv;
		}
		//내정보 화면
		@RequestMapping(value = "/myhome", method = RequestMethod.GET)
		public ModelAndView myhome(ModelAndView mv,HttpServletRequest r) {
			mv.setViewName("/main/myhome");
			MemberVo member=memberService.getMember(r);
			if(member!=null) {
				ArrayList<PayVo> pay = toonService.getPayList(member.getId());
				mv.addObject("pay", pay);
			}
			
			return mv;
		}
		@RequestMapping(value = "/myhome/info", produces="application/json; charset=utf8")
		@ResponseBody
		public Map<Object, Object> myhomeinfo(@RequestBody MemberVo member,Criteria cri) {
			Map<Object, Object> map = new HashMap<Object, Object>();
			System.out.println(member);
			MemberVo mem = memberService.getMemberName(member.getName());
			if(mem==null) {
				memberService.updatecoin(member);
				map.put("member", member);
			}else {
				map.put("res", "이미 존재하는 이름입니다.");
			}
			return map;
		}
		
	
}
