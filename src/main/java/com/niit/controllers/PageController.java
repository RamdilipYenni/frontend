package com.niit.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.model.Product;
import com.niit.model.User;

@Controller
public class PageController {
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(value= {"/" , "/home" , "/index"})
	public ModelAndView homePage(){
		ModelAndView mv = new ModelAndView();
		
		/*adding the list of categories*/
		mv.addObject("categories",categoryDao.listCategories());
		List<Product> listProducts = productDao.listProducts();
		mv.addObject("productList", listProducts);
		
		
		mv.setViewName("index");
		return mv;
	}	
	
	@RequestMapping(value="/about")
	public String val2() {
	return "About";	
	}
	
	@RequestMapping(value="/contact")
	public String val3() {
	return "Contact";	
	}
	
	@RequestMapping(value="/signup")
	public String val4(Model model) {
		model.addAttribute("user", new User());
		return "signup";	
	}

}