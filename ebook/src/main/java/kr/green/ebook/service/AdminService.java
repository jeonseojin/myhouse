package kr.green.ebook.service;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.BookeventVo;
import kr.green.ebook.vo.ClaimVo;
import kr.green.ebook.vo.GenreVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;
import kr.green.ebook.vo.WeekVo;

public interface AdminService {

	PageMaker getPageMakerByToon(Criteria cri);
	
	PageMaker getPageMakerByClaim(Criteria cri);
	
	ArrayList<ToonVo> toonList(Criteria cri);

	void insertToon(ToonVo toon);

	void updateToon(ToonVo toon);

	void insertEp(EpisodeVo ep);

	WeekVo getWeek(Integer t_week);
	
	ToonVo getToonT(String Title);

	ToonVo getToon(Integer num);

	ToonVo getToon(HttpServletRequest r);

	ArrayList<BookeventVo> eventList(Criteria cri);

	void insertEvent(BookeventVo event);

	ArrayList<PayVo> payList(Criteria cri);

	BookeventVo paybanner(Criteria cri);

	void insertPay(PayVo pay);

	ArrayList<ClaimVo> getClaim(Criteria cri);

	void insertclaim(ClaimVo cl);

	ClaimVo getClaimT(Integer num);

	void updateClaim(ClaimVo cl);

	ArrayList<ToonVo> toonRanking(Criteria cri);

	ArrayList<ToonVo> toonRankviews(Criteria cri);

	BookeventVo getEvent(String title);

	void updateEvent(BookeventVo event);

	PayVo payattend(PayVo pay);

	void getPay(String now);

	ClaimVo getClaimAnswer(int cl_num);

	void deletePay(PayVo pay);

	PageMaker getEpisodepage(Criteria cri);


}
