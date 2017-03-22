package org.mjyung.dao;

import org.mjyung.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * 
 * @author mjyung
 * @since 2017.03.13
 *
 */
public interface Repository extends JpaRepository<User, String>,
		JpaSpecificationExecutor<User> {

}