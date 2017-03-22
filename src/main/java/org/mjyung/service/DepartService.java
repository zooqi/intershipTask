package org.mjyung.service;

import java.util.List;

import org.mjyung.dao.DepartRepository;
import org.mjyung.entity.Depart;
import org.springframework.beans.factory.annotation.Autowired;

public class DepartService {
	@Autowired
	DepartRepository departRepository;
/*
	void addDepart(String departAbbreviation, String departArrayNumber,
			String departBeforeName, String departCommisionOffic,
			Boolean departDelete, Boolean departEnable, String departId,
			Boolean departMain) {
		
	}

	void updateDepart(String departId){
		
	}

	void deleteDepart(String departId){
		
	}

	List<Depart> selectDepart(String departId, String departAbbreviation){
		return departRepository.selectDepart(departId, departAbbreviation);
	}
	*/
}
