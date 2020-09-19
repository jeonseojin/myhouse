package kr.green.ebook.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.MemberVo;

public interface MemberDao {
    public MemberVo getMember(@Param("id")String id);

	public void insertMember(@Param("member")MemberVo member);

	ArrayList<MemberVo> memberList(@Param("cri")Criteria cri);

	int getTotalCountByMember(@Param("cri")Criteria cri);

	public ArrayList<ChoiceVo> getChoiceList(@Param("id")String id);

	public void updateMember(@Param("member")MemberVo member);

	public void updatecoin(@Param("member")MemberVo member);
    

}