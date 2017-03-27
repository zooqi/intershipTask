package org.mjyung.dao;

import org.mjyung.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * UserRepository
 * 
 * @author mjyung
 *
 */
@Transactional
public interface UserRepository extends JpaRepository<User, String>,
		JpaSpecificationExecutor<User> {

}
