package kr.green.ebook.service;

import java.util.ArrayList;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.ToonVo;

public interface ToonService {

	ToonVo view(String Title);

	ArrayList<ToonVo> weekList(Criteria cri);
	
	ArrayList<EpisodeVo> getEpcover(String title);

	ArrayList<EpisodeVo> getEpList(String title, String edition);

	void insertCmt(String title, String edition);

	ArrayList<EpcommentVo> getCmtList(String title, String edition);


}
