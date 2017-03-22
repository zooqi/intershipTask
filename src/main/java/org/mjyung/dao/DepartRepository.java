package org.mjyung.dao;

import java.util.List;

import org.mjyung.entity.Depart;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface DepartRepository extends Repository {
	/*
	@Query("CREATE FROM Depart WHERE departAbbreviation=?1,departArrayNumber=?2"
			+ ",departBeforeName=?3,departCommisionOffic=?4,"
			+ "departDelete=?5,departEnable=?6,departId=?7,departMain=?8")
	void addDepart(String departAbbreviation, String departArrayNumber,
			String departBeforeName, String departCommisionOffic,
			Boolean departDelete, Boolean departEnable, String departId,
			Boolean departMain);
	
	@Query("UPDATE FROM Depart WHERE departId=?1")
	void updateDepart(String departId);
	
	@Query("DELETE FROM Depart WHERE departId=?1")
	void deleteDepart(String departId);
	
	@Query("FROM Depart WHERE departId=%?1% OR departAbbreviation=%?1%")
	List<Depart> selectDepart(String departId,String departAbbreviation);
	*/
}
