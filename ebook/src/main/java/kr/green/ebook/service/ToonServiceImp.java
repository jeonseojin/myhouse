package kr.green.ebook.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.ToonVo;

@Service
public class ToonServiceImp implements ToonService {
	@Autowired
    AdminDao adminDao;
	
	//toon
	@Override
	public ToonVo view(String title) {
		ToonVo toon = adminDao.getToont(title);
		if(toon != null) {
			toon.setT_views(toon.getT_views()+1);
			adminDao.updateToon(toon);
		}
		return toon;
	}

	@Override
	public ArrayList<ToonVo> weekList(Criteria cri) {
		return adminDao.weekList(cri);
	}

	//만화내용 전 보여지는내용
	@Override
	public EpisodeVo getEp(String Title,String edition) {
		return adminDao.getEp(Title,edition);
	}
	//회차 모든 내용
	@Override
	public ArrayList<EpisodeVo> getEpcoverlist(String Title) {
		return adminDao.getEpcoverlist(Title);
	}

	//만화내용
	@Override
	public ArrayList<EpisodeVo> getEpList(String Title, String edition) {
		return adminDao.getEpList(Title,edition);
	}

	//각 화의 댓글 전체
	@Override
	public ArrayList<EpcommentVo> getCmtList(String title, String edition) {
		ArrayList<EpcommentVo> cmtlist = adminDao.getCmtList(title,edition);
		return cmtlist;
	}
	
	//댓글저장
	@Override
	public void insertEpcmt(EpcommentVo epcmt) {
		adminDao.insertEpcmt(epcmt);
		
	}
	
	//찜하기
	@Override
	public int updateChoice(String Title, String id) {
		if(adminDao.selectChoice(Title,id)!=0) return -1;
		//찜 등록
		adminDao.insertChoice(Title,id);
		adminDao.updateToonByChoice(Title);
		ToonVo toon = adminDao.getToont(Title);
		return toon.getChoice();
	}

	@Override
	public ChoiceVo getChoice(String Title,String id) {
		return adminDao.getChoice(Title,id);
	}

	@Override
	public int deleteChoice(String Title, String id) {
		ToonVo toon = adminDao.getToont(Title);
		if(adminDao.selectChoice(Title, id)==1) {
			adminDao.deleteChoice(Title,id);
			adminDao.updateToonByChoice(Title);
			return toon.getChoice();
		}
		return toon.getChoice();
	}



  
}
