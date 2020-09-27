package kr.green.ebook.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.EpcommentVo;
import kr.green.ebook.vo.EpisodeVo;
import kr.green.ebook.vo.GenreVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;
import kr.green.ebook.vo.UpVo;

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
		public ArrayList<EpisodeVo> getEpList(String title, String edition) {
			ArrayList<EpisodeVo> eplist = adminDao.getEpList(title,edition);
			return eplist;
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
			
//작품을 찜한 수
		@Override
		public int updateChoice(String Title, String id) {
			if(adminDao.selectChoice(Title,id)!=0) return -1;
			//찜 등록
			adminDao.insertChoice(Title,id);
			adminDao.updateToonByChoice(Title);
			ToonVo toon = adminDao.getToont(Title);
			return toon.getChoice();
		}
//찜하기 기능
		@Override
		public ChoiceVo getChoice(String Title,String id) {
			return adminDao.getChoice(Title,id);
		}
//찜하기 취소
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
//추천 기능
		@Override
		public UpVo getUp(String Title,String id) {
			return adminDao.getUp(Title,id);
		}
		@Override
		public int updateUp(String Title, String id) {
			if(adminDao.selectUp(Title,id) != 0) return -1;
			//추천을 등록
			adminDao.insertUp(Title,id);
			//추천수만 업데이트
			adminDao.updateToonByUp(Title);
			//정보를 가져옴
			ToonVo toon = adminDao.getToont(Title);
			return toon.getUp();
		}
//해당 회원의 결제내역 불러오기
		@Override
		public ArrayList<PayVo> getPayList(String id) {
			return adminDao.getPayList(id);
		}
//해당 회원의 소장웹툰
		@Override
		public ArrayList<ToonVo> getPayToon(String id) {
			return adminDao.getPayToon(id);
		}
//장르랭킹
		@Override
		public ArrayList<ToonVo> genreRank(Criteria cri) {
			return adminDao.genreRank(cri);
		}
//전체 장르
		@Override
		public ArrayList<GenreVo> getGenrelist(Criteria cri) {
			return adminDao.getGenrelist(cri);
		}
//완결 장르 찾기
		@Override
		public ArrayList<ToonVo> TheendGenre(Criteria cri) {
			return adminDao.TheendGenre(cri);
		}
//댓글 좋아요기능
		@Override
		public int updatecommentUp(String num, String id) {
			if(adminDao.cmtUp(num,id) != 0) return -1;
			//추천을 등록
			adminDao.insertepcmtUp(num,id);
			//추천수만 업데이트
			adminDao.updateEmt(num);
			//정보를 가져옴
			EpcommentVo epcmt = adminDao.getCmt(num);
			return epcmt.getCo_up();
		}
//댓글 좋아요기능
		@Override
		public int updatecommentDown(String num, String id) {
			if(adminDao.cmtDown(num,id) != 0) return -1;
			//추천을 등록
			adminDao.insertepcmtDown(num,id);
			//추천수만 업데이트
			adminDao.updateEmt(num);
			//정보를 가져옴
			EpcommentVo epcmt = adminDao.getCmt(num);
			return epcmt.getCo_down();
		}
//댓글지우기
		@Override
		public void deletecmt(String num) {
			EpcommentVo cmt = adminDao.getCmt(num);
			if(cmt!=null) {
				adminDao.deletecmt(num);
			}
		}
}
