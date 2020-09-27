package kr.green.ebook.service;

import java.util.ArrayList;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.GenreVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;
import kr.green.ebook.vo.UpVo;

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

	ArrayList<PayVo> getPayList(String id);

	ArrayList<ToonVo> getPayToon(String id);

	ArrayList<ToonVo> genreRank(Criteria cri);

	UpVo getUp(String Title, String id);

	int updateUp(String Title, String id);

	ArrayList<GenreVo> getGenrelist(Criteria cri);

	ArrayList<ToonVo> TheendGenre(Criteria cri);

}
