package kr.green.ebook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.ebook.dao.AdminDao;
import kr.green.ebook.vo.ToonVo;

@Service
public class ToonServiceImp implements ToonService {

	@Autowired
    AdminDao adminDao;

	public ToonVo getToon(String t_title) {
		if(t_title==null) return null;
		return adminDao.getToon(t_title);
	}
	
	@Override
	public ToonVo view(String t_title) {
		ToonVo toon = adminDao.getToon(t_title);
		if(toon != null) {
			toon.setViews(toon.getViews()+1);
			adminDao.updateToon(toon);
			System.out.println("view :" + t_title);
		}
		
		return toon;
	}
	

}
