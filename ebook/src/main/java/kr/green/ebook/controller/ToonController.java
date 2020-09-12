package kr.green.ebook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.service.ToonService;
import kr.green.ebook.vo.MemberVo;
import kr.green.ebook.vo.ToonVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ToonController {
	
	private static final Logger logger = LoggerFactory.getLogger(ToonController.class);
	
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	@Autowired
	ToonService toonService;
	
	@RequestMapping(value = "/toon", method = RequestMethod.GET)
	public ModelAndView webtoon(ModelAndView mv, Criteria cri) {
		mv.setViewName("/toon/week");
		ArrayList<ToonVo> wlist = adminService.weekList(cri);
		mv.addObject("wlist", wlist);
		PageMaker pm = adminService.getPageMakerByToon(cri);
		mv.addObject("pm", pm);
		return mv;
	}
	@RequestMapping(value = "/toon/ep", method = RequestMethod.GET)
	public ModelAndView toonEp(ModelAndView mv,String t_title, Criteria cri) {
		mv.setViewName("/toon/ep");
		ToonVo toon = toonService.view(t_title);
		mv.addObject("toon", toon);
		mv.addObject("cri", cri);
		return mv;
	}

}
