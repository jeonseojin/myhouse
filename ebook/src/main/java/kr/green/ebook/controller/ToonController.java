package kr.green.ebook.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.service.ToonService;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
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
	public ModelAndView toonEp(ModelAndView mv,String Title, Criteria cri) {
		mv.setViewName("/toon/ep");
		ToonVo toon = toonService.view(Title);
		mv.addObject("toon", toon);
		ArrayList<EpisodeVo> epcov = toonService.getEpcoverlist(Title);
		mv.addObject("epcov", epcov);
		PageMaker pm = adminService.getPageMakerByToon(cri);
		mv.addObject("pm", pm);
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
		System.out.println(epcov);
		return mv;
	}
	
	@RequestMapping(value = "/toon/comic", method = RequestMethod.POST)
	public ModelAndView tooncomicPost(ModelAndView mv, EpcommentVo epcmt) {
		mv.setViewName("redirect:/toon/week");
		toonService.insertEpcmt(epcmt);
		return mv;
	}
	@RequestMapping(value = "/comment", method = RequestMethod.GET)
	public ModelAndView comm(ModelAndView mv, Criteria cri) {
		mv.setViewName("/toon/comment");
		return mv;
	}
}
