package kr.green.ebook.service;

import javax.servlet.http.HttpServletRequest;

import kr.green.ebook.vo.MemberVo;

public interface MemberService {

	MemberVo isMember(MemberVo member);

	MemberVo getMember(String id);
	
	MemberVo getMember(HttpServletRequest r);

	boolean signup(MemberVo member);

}