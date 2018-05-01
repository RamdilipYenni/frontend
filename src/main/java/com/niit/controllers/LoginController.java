package com.niit.controllers;
import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	@RequestMapping(value="/welcome",method=RequestMethod.GET)
	public String loginpage(Model model,HttpSession session) {
		
		String page=null;
		boolean loggedIn=false;
		
		SecurityContext securitycontext = SecurityContextHolder.getContext();
		Authentication authentication = securitycontext.getAuthentication();
		
		String username = authentication.getName();
		//Return all roles
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)authentication.getAuthorities();
		
		for(GrantedAuthority role: authorities) {
			
			session.setAttribute("role",role.getAuthority());
			System.out.println(role.getAuthority());
			if(role.getAuthority().equals("ROLE_USER")) {
					loggedIn=true;
					page = "UserHome";
					session.setAttribute("loggedIn", loggedIn);
					session.setAttribute("username", username);
					
			}
			else {
					loggedIn=true;
					page = "AdminHome";
					session.setAttribute("username", username);
					session.setAttribute("loggedIn", loggedIn);
			}
		}
		return page;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "Login";
	}
	
	@RequestMapping(value="/loginfailed",method=RequestMethod.GET)
	public String loginerror() {
		return "Login";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logoutpage()
	{	
		return "index";
	}	