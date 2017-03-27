package org.mjyung.dao;

import org.mjyung.entity.Depart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface DepartRepository extends JpaRepository<Depart, String>,
		JpaSpecificationExecutor<Depart> {

}
