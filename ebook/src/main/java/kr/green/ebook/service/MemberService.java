package kr.green.ebook.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.MemberVo;

public interface MemberService {

	MemberVo isMember(MemberVo member);

	MemberVo getMember(String id);
	
	MemberVo getMember(HttpServletRequest r);

	boolean signup(MemberVo member);

	ArrayList<MemberVo> memberList(Criteria cri);

	PageMaker getPageMakerByMember(Criteria cri);

	ArrayList<ChoiceVo> getChoiceList(String id);

	void updatecoin(MemberVo member);
}