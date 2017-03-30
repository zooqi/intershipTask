package org.mjyung.dao;

import org.mjyung.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * UserRepository
 * 
 * @author mjyung
 *
 */
public interface UserRepository extends JpaRepository<User, String>,
		JpaSpecificationExecutor<User> {

}
