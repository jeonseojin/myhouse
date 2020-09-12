package kr.green.ebook.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.GenreVo;
import kr.green.ebook.vo.ToonVo;
import kr.green.ebook.vo.WeekVo;

public interface AdminDao {

//	작품리스트 정렬
	ArrayList<ToonVo> toonList(@Param("cri")Criteria cri);

	public int getTotalCountByToon(@Param("cri")Criteria cri);

	void insertToon(@Param("toon")ToonVo toon);

	void insertEp(@Param("ep")EpisodeVo ep);

// 연재
	
	ToonVo getToon(@Param("num")Integer num);

	void updateToon(@Param("toon")ToonVo toon);

	WeekVo getWeek(@Param("t_week")int t_week);

	GenreVo getGr(@Param("t_code")String t_code);
	
	ArrayList<ToonVo> weekList(@Param("cri")Criteria cri);

	ToonVo getToont(@Param("Title")String Title);

	ArrayList<EpisodeVo> getEpcover(@Param("title")String title);

	ArrayList<EpisodeVo> getEpList(@Param("title")String title,@Param("edition")String edition);

	ArrayList<EpcommentVo> getCmtList(@Param("title")String title,@Param("edition")String edition);

}
