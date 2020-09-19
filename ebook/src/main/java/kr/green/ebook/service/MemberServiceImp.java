package kr.green.ebook.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.ebook.dao.MemberDao;
import kr.green.ebook.pagination.Criteria;
import kr.green.ebook.pagination.PageMaker;
import kr.green.ebook.vo.ChoiceVo;
import kr.green.ebook.vo.MemberVo;

@Service
public class MemberServiceImp implements MemberService {
    @Autowired
    MemberDao memberDao;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;
    
    //회원정보
    @Override
    public MemberVo getMember(String id) {
    	return memberDao.getMember(id);
    }

    //로그인 시도 회원
	@Override
	public MemberVo isMember(MemberVo member) {
		MemberVo dbMember = memberDao.getMember(member.getId());
		if(dbMember != null && passwordEncoder.matches(member.getPw(), dbMember.getPw())) {
			return dbMember;
		}
		return null;
	}

	//회원가입정보
	@Override
	public boolean signup(MemberVo member) {
		if(member==null) return false;
		if(memberDao.getMember(member.getId()) !=null || member.getId().length() == 0) return false;
		if(member.getPw()==null || member.getPw().length()==0) return false;
		if(member.getEmail()==null || member.getEmail().length()==0 || !member.getEmail().contains("@")) return false;
		if(member.getGender()==null || member.getGender().length()==0)
			member.setGender("mail");
		member.setAuth("USER");
		member.setIsDel("N");
		
		//비밀번호 암호화
		String encodePw = passwordEncoder.encode(member.getPw());
		member.setPw(encodePw);
		memberDao.insertMember(member);
		return false;
	}

	@Override
	public MemberVo getMember(HttpServletRequest r) {
		return (MemberVo)r.getSession().getAttribute("member");
	}

	@Override
	public ArrayList<MemberVo> memberList(Criteria cri) {
		return memberDao.memberList(cri);
	}

	@Override
	public PageMaker getPageMakerByMember(Criteria cri) {
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(memberDao.getTotalCountByMember(cri));
		return pm;
	}

	@Override
	public ArrayList<ChoiceVo> getChoiceList(String id) {
		return memberDao.getChoiceList(id);
	}

	@Override
	public void updatecoin(MemberVo member) {
		memberDao.updatecoin(member);
		
	}
}
