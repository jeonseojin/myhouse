package kr.green.ebook.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.pagination.Criteria;
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
	public ArrayList<EpisodeVo> getEpcover(String title) {
		return adminDao.getEpcover(title);
	}

	//만화내용
	@Override
	public ArrayList<EpisodeVo> getEpList(String title, String edition) {
		ArrayList<EpisodeVo> eplist = adminDao.getEpList(title,edition);
		return eplist;
	}

	@Override
	public void insertCmt(String title, String edition) {
				
	}
	//각화의 댓글
	@Override
	public ArrayList<EpcommentVo> getCmtList(String title, String edition) {
		ArrayList<EpcommentVo> cmtlist = adminDao.getCmtList(title,edition);
		return cmtlist;
	}
  
}
