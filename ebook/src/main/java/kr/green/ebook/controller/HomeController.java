package kr.green.ebook.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.vo.MemberVo;
import kr.green.ebook.vo.ToonVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, Criteria cri) {
		mv.setViewName("/main/home");
		return mv;
	}
	
	// main페이지에서 header를 통한 로그인 동작
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
	
}
