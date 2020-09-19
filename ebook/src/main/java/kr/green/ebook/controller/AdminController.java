package kr.green.ebook.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.service.ToonService;
import kr.green.ebook.utils.UploadFileUtils;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.BookeventVo;
import kr.green.ebook.vo.ClaimVo;
import kr.green.ebook.vo.MemberVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;
import kr.green.ebook.vo.WeekVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
	@Autowired
	ToonService toonService;
	
	private String uploadPath = "D:\\전서진\\포트폴리오\\port\\ebook\\src\\main\\webapp\\resources\\img";
	
	//유저관리
	@RequestMapping(value = "/admin/user", method = RequestMethod.GET)
	public ModelAndView user(ModelAndView mv, Criteria cri) {
		mv.setViewName("/admin/user");
		ArrayList<MemberVo> list = memberService.memberList(cri);
		mv.addObject("list", list);
		PageMaker pm = memberService.getPageMakerByMember(cri);
		mv.addObject("pm", pm);
		return mv;
	}
	
	//작품관리
	@RequestMapping(value = "/admin/toon", method = RequestMethod.GET)
	public ModelAndView adminToon(ModelAndView mv, Criteria cri){
		mv.setViewName("/admin/toon");
		ArrayList<ToonVo> tlist = adminService.toonList(cri);
		mv.addObject("tlist", tlist);
		PageMaker pm = adminService.getPageMakerByToon(cri);
		mv.addObject("pm", pm);
		return mv;
	}
	
	//작품등록 기능
	@RequestMapping(value = "/admin/toon", method = RequestMethod.POST)
	public ModelAndView adminToonPost(ModelAndView mv, ToonVo toon, MultipartFile file2,MultipartFile file1) throws IOException, Exception {
		mv.setViewName("redirect:/admin/toon");
		String t_img = UploadFileUtils.uploadFile(uploadPath,"\\"+toon.getT_title(), file2.getOriginalFilename(), file2.getBytes());
		toon.setT_img(t_img);
		String t_typify = UploadFileUtils.uploadFile(uploadPath,"\\"+toon.getT_title(), file1.getOriginalFilename(), file1.getBytes());
		toon.setT_typify(t_typify);
		adminService.insertToon(toon);
		return mv;
	}
	
	//연재등록페이지
	@RequestMapping(value = "/admin/ep", method = RequestMethod.GET)
	public ModelAndView adminEp(ModelAndView mv,Integer num, Criteria cri){
		mv.setViewName("/admin/register");
		ToonVo toon = adminService.getToon(num);
		mv.addObject("toon", toon);
		WeekVo week = adminService.getWeek(adminService.getToon(num).getT_week());
		mv.addObject("week", week);
		mv.addObject("cri", cri);
		return mv;
	}
	
	//연재등록
	@RequestMapping(value = "/admin/ep", method = RequestMethod.POST)
	public ModelAndView adminEpPost(ModelAndView mv, EpisodeVo ep, MultipartHttpServletRequest mr) throws IOException, Exception {
		mv.setViewName("redirect:/admin/toon");
		String filename = "";
		byte[] fileby;
		List<MultipartFile> fileList = mr.getFiles("file2");
		for(MultipartFile filePart : fileList) {
			filename = filePart.getOriginalFilename();
			fileby = filePart.getBytes();
			String e_img = UploadFileUtils.uploadFile(uploadPath,"\\"+ ep.getE_t_title(),filename,fileby);
			ep.setE_img(e_img);
			adminService.insertEp(ep);
		}
		return mv;
	}
	
	//작품상세페이지
	@RequestMapping(value = "/admin/detail", method = RequestMethod.GET)
	public ModelAndView toonEp(ModelAndView mv,String Title,Integer num, Criteria cri) {
		mv.setViewName("/admin/detail");
		ToonVo toon = adminService.getToonT(Title);
		mv.addObject("toon", toon);
		WeekVo week = adminService.getWeek(toon.getT_week());
		mv.addObject("week", week);
		mv.addObject("cri", cri);
		return mv;
	}
	//수정페이지
	@RequestMapping(value = "/admin/modify", method = RequestMethod.GET)
	public ModelAndView toonEpModify(ModelAndView mv,Integer num, Criteria cri) {
		mv.setViewName("/admin/modify");
		ToonVo toon = adminService.getToon(num);
		mv.addObject("toon", toon);
		WeekVo week = adminService.getWeek(adminService.getToon(num).getT_week());
		mv.addObject("week", week);
		mv.addObject("cri", cri);
		return mv;
	}
	//수정기능
	@RequestMapping(value ="/admin/modify", method= RequestMethod.POST)
	public ModelAndView ToonEpMPost(ModelAndView mv,ToonVo toon,Integer num,MultipartFile file1,MultipartFile file2) throws IOException, Exception  {
		mv.setViewName("redirect:/admin/toon");
		if(!file1.getOriginalFilename().equals("")) {
			String fileName = UploadFileUtils.uploadFile(uploadPath,"\\"+toon.getTitle(), file1.getOriginalFilename(), file1.getBytes());
			toon.setT_typify(fileName);
		}else if(toon.getT_typify()==null || toon.getT_typify().equals("")) {
			toon.setT_typify(null);
		}
		if(!file2.getOriginalFilename().equals("")) {
			String fileName = UploadFileUtils.uploadFile(uploadPath,"\\"+toon.getTitle(), file2.getOriginalFilename(), file2.getBytes());
			toon.setT_img(fileName);
		}else if(toon.getT_img()==null || toon.getT_img().equals("")) {
			toon.setT_img(null);
		}		
		adminService.updateToon(toon);
		return mv;
	}
	
	//이벤트관리
	@RequestMapping(value = "/admin/event", method = RequestMethod.GET)
	public ModelAndView adminEvent(ModelAndView mv, Criteria cri) {
		mv.setViewName("/admin/event");
		ArrayList<ToonVo> tlist = adminService.toonList(cri);
		mv.addObject("tlist", tlist);
		ArrayList<BookeventVo> evlist = adminService.eventList(cri);
		mv.addObject("evlist", evlist);
		PageMaker pm = memberService.getPageMakerByMember(cri);
		mv.addObject("pm", pm);
		return mv;
	}
	//이벤트등록
	@RequestMapping(value = "/admin/event", method = RequestMethod.POST)
	public ModelAndView adminEventPost(ModelAndView mv,BookeventVo event,MultipartFile file1,MultipartFile file2,MultipartFile file3) throws IOException, Exception {
		mv.setViewName("redirect:/admin/event");
		String ev_img = UploadFileUtils.uploadFile(uploadPath,"\\"+event.getEv_engtitle(), file2.getOriginalFilename(), file1.getBytes());
		event.setEv_img(ev_img);
		String ev_banner = UploadFileUtils.uploadFile(uploadPath,"\\"+event.getEv_engtitle(), file2.getOriginalFilename(), file2.getBytes());
		event.setEv_banner(ev_banner);
		String ev_page = UploadFileUtils.uploadFile(uploadPath,"\\"+event.getEv_engtitle(), file3.getOriginalFilename(), file3.getBytes());
		event.setEv_page(ev_page);
		adminService.insertEvent(event);
		return mv;
	}
	//관리자 충전관리페이지
	@RequestMapping(value = "/admin/pay", method = RequestMethod.GET)
	public ModelAndView adminPay(ModelAndView mv, Criteria cri) {
		mv.setViewName("/admin/pay");
		ArrayList<ToonVo> tlist = adminService.toonList(cri);
		mv.addObject("tlist", tlist);
		ArrayList<PayVo> paylist = adminService.payList(cri);
		mv.addObject("paylist", paylist);
		ArrayList<MemberVo> memberlist = memberService.memberList(cri);
		mv.addObject("memberlist", memberlist);
		PageMaker pm = memberService.getPageMakerByMember(cri);
		mv.addObject("pm", pm);
		return mv;
	}
	//관리자 충전기능페이지
	@RequestMapping(value = "/toon/payment", method = RequestMethod.GET)
	public ModelAndView adminaddpay(ModelAndView mv, Criteria cri) {
		mv.setViewName("/toon/payment");
		BookeventVo ev = adminService.paybanner(cri);
		mv.addObject("ev", ev);
		return mv;
	}
	//관리자 충전기능페이지
	@RequestMapping(value = "/toon/payment", method = RequestMethod.POST)
	public ModelAndView adminpayment(ModelAndView mv,PayVo pay,HttpServletRequest r) {
		mv.setViewName("redirect:/");
		MemberVo member = memberService.getMember(r);
		if(member!=null) {
			pay.setP_member(member.getName());
			member.setCoin(member.getCoin()+pay.getP_charging());
			adminService.insertPay(pay);
			memberService.updatecoin(member);
		}
		return mv;
	}
	//관리자 문의페이지
	@RequestMapping(value = "/admin/claim", method = RequestMethod.GET)
	public ModelAndView adminclaim(ModelAndView mv, Criteria cri){
		mv.setViewName("/admin/claim");
		ArrayList<ClaimVo> cl =adminService.getClaim(cri);
		mv.addObject("cl", cl);
		PageMaker pm = adminService.getPageMakerByClaim(cri);
		mv.addObject("pm", pm);
		return mv;
	}
	//관리자 공지사항 등록페이지
	@RequestMapping(value = "/admin/notice", method = RequestMethod.GET)
	public ModelAndView adminNotice(ModelAndView mv, Criteria cri,ClaimVo cl){
		mv.setViewName("/admin/notice");
		return mv;
	}
	
	//관리자 공지사항 등록기능
	@RequestMapping(value = "/admin/notice", method = RequestMethod.POST)
	public ModelAndView adminNoticeP(ModelAndView mv, Criteria cri,ClaimVo cl){
		ArrayList<ClaimVo> clist =adminService.getClaim(cri);
		mv.setViewName("redirect:/admin/cldetail?num="+clist.get(clist.size()-1).getCl_num());
		cl.setCl_content(cl.getCl_content().replaceAll("\n", "<br>"));
		adminService.insertclaim(cl);
		return mv;
	}
	//공지사항 자세히보기
	@RequestMapping(value = "/admin/cldetail", method = RequestMethod.GET)
	public ModelAndView admincldetail(ModelAndView mv, Criteria cri,Integer num){
		mv.setViewName("/admin/cldetail");
		ClaimVo cl = adminService.getClaimT(num);
		mv.addObject("cl", cl);
		mv.addObject("cri", cri);
		return mv;
	}
	//관리자 공지사항 등록페이지
	@RequestMapping(value = "/admin/clmodify", method = RequestMethod.GET)
	public ModelAndView adminclmodify(ModelAndView mv, Criteria cri,Integer num){
		mv.setViewName("/admin/clmodify");
		ClaimVo cl = adminService.getClaimT(num);
		mv.addObject("cl", cl);
		mv.addObject("cri", cri);
		return mv;
	}
	@RequestMapping(value = "/admin/clmodify", method = RequestMethod.POST)
	public ModelAndView adminclmodifyP(ModelAndView mv, Criteria cri,ClaimVo cl){
		mv.setViewName("redirect:/admin/cldetail");
		adminService.updateClaim(cl);
		mv.addObject("cri", cri);
		return mv;
	}
}