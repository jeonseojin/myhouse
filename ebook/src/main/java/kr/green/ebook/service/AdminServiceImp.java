package kr.green.ebook.service;

import java.text.SimpleDateFormat;
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
import kr.green.ebook.vo.BookeventVo;
import kr.green.ebook.vo.ClaimVo;
import kr.green.ebook.vo.GenreVo;
import kr.green.ebook.vo.MemberVo;
import kr.green.ebook.vo.PayVo;
import kr.green.ebook.vo.ToonVo;
import kr.green.ebook.vo.WeekVo;

@Service
public class AdminServiceImp implements AdminService {
	@Autowired
    AdminDao adminDao;
	@Autowired
    MemberDao memberDao;
	
//작품 + 정렬
		@Override
		public ArrayList<ToonVo> toonList(Criteria cri) {
			//연재에서 오늘 완결로 넘어가는 웹툰들을 찾아서 update 후 웹툰 전체 리스트를 넘겨줌
			SimpleDateFormat nowTime = new SimpleDateFormat ( "yyyy-MM-dd");
			String now = nowTime.format (System.currentTimeMillis());
			ArrayList<ToonVo> toon = adminDao.toonEnd(cri,now);
			for (int i = 0; i < toon.size(); i++) {
				if(toon.get(i).getT_lastEpdate().equals(now)) {
					toon.get(i).setLastEpisode("Y");
					adminDao.updateToon(toon.get(i));
				}
			}
			return adminDao.toonList(cri);
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
//이벤트 전체
		@Override
		public ArrayList<BookeventVo> eventList(Criteria cri) {
			return adminDao.eventList(cri);
		}
//이벤트 등록
		@Override
		public void insertEvent(BookeventVo event) {
			adminDao.insertEvent(event);		
		}
//이벤트 불러오기
		@Override
		public BookeventVo getEvent(String title) {
			return adminDao.getEvent(title);
		}
//이벤트 수정
		@Override
		public void updateEvent(BookeventVo event) {
			adminDao.updateEvent(event);
		}
//충전 전체 리스트
		@Override
		public ArrayList<PayVo> payList(Criteria cri) {
			return adminDao.payList(cri);
		}
//충전화면배너
		@Override
		public BookeventVo paybanner(Criteria cri) {
			return adminDao.paybanner(cri);
		}
//충전기능
		@Override
		public void insertPay(PayVo pay) {
			adminDao.insertPay(pay);
		}

//문의내역 
		@Override 
		public ArrayList<ClaimVo> getClaim(Criteria cri) { 
			return adminDao.getClaim(cri); 
		}
//문의등록&공지사항 등록
		@Override
		public void insertclaim(ClaimVo cl) {
			adminDao.insertclaim(cl);
			
		}
//공지사항 자세히보기
		@Override
		public ClaimVo getClaimT(Integer num) {
			return adminDao.getClaimT(num);
		}
// 문의페이지네이션
		@Override
		public PageMaker getPageMakerByClaim(Criteria cri) {
				PageMaker pm = new PageMaker();
				pm.setCri(cri);
				pm.setTotalCount(adminDao.getTotalCountByClaim(cri));
			return pm;
		} 
// 작품페이지네이션
		@Override
		public PageMaker getPageMakerByToon(Criteria cri) {
			PageMaker pm = new PageMaker();
			pm.setCri(cri);
			pm.setTotalCount(adminDao.getTotalCountByToon(cri));
			return pm;
		}
//문의수정
		@Override
	public void updateClaim(ClaimVo cl) {
			adminDao.updateClaim(cl);			
		}
//랭킹관련/up
		@Override
		public ArrayList<ToonVo> toonRanking(Criteria cri) {
			return adminDao.toonRanking(cri);
		}
//랭킹관련/view
		@Override
		public ArrayList<ToonVo> toonRankviews(Criteria cri) {
			return adminDao.toonRankviews(cri);
		}
//해당유저의출석여부
		@Override
		public PayVo payattend(PayVo pay) {
			return adminDao.payattend(pay);
		}
//출석포인트 차감
		@Override
		public void getPay(String now) {
			ArrayList<PayVo> pay= adminDao.getPay(now);
			if(pay!=null) {
				for (int i = 0; i < pay.size(); i++) {
					MemberVo member = memberDao.getMember(pay.get(i).getP_member());
					PayVo p = new PayVo();
					p.setP_point(1);
					p.setP_title("출석이벤트 유효기간 만료");
					p.setP_member(pay.get(i).getP_member());
					p.setP_usedate(null);
					p.setP_one("N");
					member.setCoin(member.getCoin()-1);
					memberDao.updateMember(member);
					adminDao.insertPay(p);
					adminDao.deletePay(pay.get(i));
					
				}
			}
		}
//문의답변
		@Override
		public ClaimVo getClaimAnswer(int num) {
			return adminDao.getClaimAnswer(num);
		}
//지급된 출석 포인트 제거
		@Override
		public void deletePay(PayVo pay) {
			adminDao.deletePay(pay);
			
		}
//연재 페이지네이션
			@Override
			public PageMaker getEpisodepage(Criteria cri) {
				PageMaker pm = new PageMaker();
				pm.setCri(cri);
				pm.setTotalCount(adminDao.getEpisodepage(cri));
				return pm;
			}

}
