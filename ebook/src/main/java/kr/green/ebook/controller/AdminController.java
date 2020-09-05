package kr.green.ebook.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.service.AdminService;
import kr.green.ebook.service.MemberService;
import kr.green.ebook.utils.UploadFileUtils;
import kr.green.ebook.vo.MemberVo;
import kr.green.ebook.vo.ToonVo;

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
	
	private String uploadPath = "D:\\JAVA\\spring\\port\\ebook\\src\\main\\webapp\\resources\\img";
	
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
	public ModelAndView adminToonPost(ModelAndView mv, ToonVo toon, HttpServletRequest r, MultipartFile file2) throws IOException, Exception {
		mv.setViewName("redirect:/admin/toon");
		String t_img = UploadFileUtils.uploadFile(uploadPath,"\\"+toon.getTitle(), file2.getOriginalFilename(), file2.getBytes());
		toon.setT_img(t_img);
		adminService.insertToon(toon);
		return mv;
	}
	
	//작품등록(파일다운로드) 기능
	@RequestMapping(value = "/admin/download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	        String FormatName = fileName.substring(fileName.lastIndexOf(".")+1);
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);

	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
}