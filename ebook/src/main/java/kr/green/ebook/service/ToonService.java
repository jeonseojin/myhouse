package kr.green.ebook.service;

import java.util.ArrayList;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;

public interface ToonService {

	ToonVo view(String Title);

	ArrayList<ToonVo> weekList(Criteria cri);
	
	EpisodeVo getEp(String Title, String edition);

	ArrayList<EpisodeVo> getEpList(String Title, String edition);

	ArrayList<EpcommentVo> getCmtList(String Title, String edition);

	void insertEpcmt(EpcommentVo epcmt);

	ArrayList<EpisodeVo> getEpcoverlist(String Title);

	int updateChoice(String Title, String id);
	
	ChoiceVo getChoice(String Title, String id);

	int deleteChoice(String Title, String id);

	ArrayList<PayVo> getPayList(String name);

	ArrayList<ToonVo> getPayToon(String name);

}
