package org.mjyung.dao;

import org.mjyung.entity.Depart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface DepartRepository extends JpaRepository<Depart, String>,
		JpaSpecificationExecutor<Depart> {

}
