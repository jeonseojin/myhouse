package kr.green.ebook.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.ebook.vo.MemberVo;

public interface MemberDao {

	MemberVo getMember(@Param("id")String id);


}