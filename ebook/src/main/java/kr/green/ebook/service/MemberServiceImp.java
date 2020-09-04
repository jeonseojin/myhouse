package kr.green.ebook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.ebook.dao.MemberDao;
import kr.green.ebook.vo.MemberVo;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
    MemberDao memberDao;
	@Autowired
    BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public MemberVo isMember(MemberVo member) {
		MemberVo dbMember = memberDao.getMember(member.getId());
		if(dbMember != null && passwordEncoder.matches(member.getPw(), dbMember.getPw())) {
			return dbMember;
		}
		return null;
	}

}
