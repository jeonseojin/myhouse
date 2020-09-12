package kr.green.ebook.service;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.dao.MemberDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.GenreVo;
import kr.green.ebook.vo.ToonVo;
import kr.green.ebook.vo.WeekVo;

@Service
public class AdminServiceImp implements AdminService {
	@Autowired
    AdminDao adminDao;
	
//작품 + 정렬
	@Override
	public ArrayList<ToonVo> toonList(Criteria cri) {
		return adminDao.toonList(cri);

	}
	
// 작품페이지네이션
	@Override
	public PageMaker getPageMakerByToon(Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(adminDao.getTotalCountByToon(cri));
		return pm;
	}

//작품등록
	@Override
	public void insertToon(ToonVo toon) {
		if(toon.getT_week()==0) toon.setT_week('1');
		if(toon.getT_type() == null || toon.getT_type().length()==0) toon.setT_type("#1");
		toon.setLastEpisode("N");
		adminDao.insertToon(toon);
	}
//연재작품등록
	@Override
	public void insertEp(EpisodeVo ep) {
		if(ep.getE_title()==null||ep.getE_title().length()==0)
			ep.setE_title(null);
		adminDao.insertEp(ep);
	}

//웹툰수정하기
	@Override
	public void updateToon(ToonVo toon) {
		adminDao.updateToon(toon);	
	}
//웹툰찾기
	@Override
	public ToonVo getToon(HttpServletRequest r) {
		return (ToonVo)r.getSession().getAttribute("toon");
	}

//번호로 웹툰찾기
	@Override
	public ToonVo getToon(Integer num) {
		if(num==null) return null;
		return adminDao.getToon(num);
	}
		@Override
	public ToonVo getToonT(String Title) {
		return adminDao.getToont(Title);
	}
//요일찾기
	@Override
	public WeekVo getWeek(Integer t_week) {
		if(t_week==null || t_week.SIZE==0) return null;
		return adminDao.getWeek(t_week);
	}
//장르찾기
	@Override
	public GenreVo getGr(String t_type) {
		if(t_type==null|| t_type.length()==0) return null;
		return adminDao.getGr(t_type);
	}








}
