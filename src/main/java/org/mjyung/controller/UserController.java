package org.mjyung.controller;

import javax.annotation.Resource;

import org.mjyung.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * user控制器
 * 
 * @author mjyung
 * @since 2017.03.13
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource(name = "userService")
	private UserService userService;
	
}