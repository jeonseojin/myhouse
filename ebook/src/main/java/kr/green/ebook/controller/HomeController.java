package kr.green.ebook.controller;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
	private JavaMailSender mailSender;//mail보내기용 Autowired
	
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
		//내정보수정
		@RequestMapping(value = "/myhome/info", produces="application/json; charset=utf8")
		@ResponseBody
		public Map<Object, Object> myhomepass(@RequestBody String pw,HttpServletRequest r) {
			Map<Object, Object> map = new HashMap<Object, Object>();
			MemberVo member = memberService.getMember(r);
			member.setPw(pw);
			memberService.updateMember(member);
			map.put("res", "비밀번호가 변경되었습니다.");
			return map;
		}
		
		//Gmail을 보내기 위한 메소드 추가(https://www.google.com/settings/security/lesssecureapps에서 보안 수준 사용으로 변경)
		@RequestMapping(value = "/mail/mailSending")// /mail/mailSending의 코드가 오면 아래의 내용을 실행
		public String mailSending(HttpServletRequest request) {

		    String setfrom = "stajun@naver.com";         
		    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
		    String title   = request.getParameter("title");      // 제목
		    String id = request.getParameter("content");    // 내용

		    
	        // 랜덤으로 비밀번호를 생성(13자리의 비밀번호를 생성)
		    int len = 13;
		    String newPw = "";//새로운 비밀번호는 처음에 공백으로 생성
		    for(int i=0;i<13;i++) {
		    	//0~9는 숫자 0~9
		    	//10~35는 소문자 a~z
		    	//36~61은 대문자 A~Z
		    	int r = (int)(Math.random()*62);
		    	char ch;
		    	if(r <= 9) {
		    		ch = (char)('0'+r);
		    		//
		    	}else if(r <= 35) {
		    		ch = (char)('a'+(r-10));
		    		// a+0을 해야 소문자 a가 나오기 때문에 10일때 a가 나오도록
		    	}else {
		    		ch = (char)('A'+(r-36));
		    	}newPw += ch;//비밀버호를 결합
		    }
	        // 생성된 비밀번호를 회원 정보에 저장(DB)
		    memberService.newPw(id, newPw);
	        // 메일로 변경된 비밀번호를 전송 */
		    try {//runtime exception이 아닌 다른 exception이 발생할 수 있다.
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper 
		            = new MimeMessageHelper(message, true, "UTF-8");
		        //위의 내용은 메일을 보내기 위한 하나의 공식으로 보면 됨
		        
		       
		        String format1 = "<h1> 새로운 비밀번호입니다.</h1>"+"<h2>";
		        String format2 = "</h2>";
		        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		        messageHelper.setTo(tomail);     // 받는사람 이메일
		        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		        messageHelper.setText(format1+newPw+format2,true);  // 메일 내용

		        mailSender.send(message);
		    } catch(Exception e){
		        System.out.println(e);
		    }

		    return "redirect:/";
		}
		//메일보내기 화면
		@RequestMapping(value = "/mail", method = RequestMethod.GET)
		public ModelAndView mailGet(ModelAndView mv) {
			logger.info("URI:/mail:GET");
			mv.setViewName("/main/mail");		
			return mv;
		}
	
}
