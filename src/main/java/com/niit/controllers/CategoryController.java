package com.niit.controllers;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.model.Category;

@Controller
public class CategoryController {

	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value ="/category")
	public ModelAndView categoryPage(Model m) {
		
		List<Category> listCategories = categoryDao.listCategories();
		m.addAttribute("categoryList", listCategories);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Category");
		return mv;
	}
	
	@RequestMapping(value ="/InsertCategory", method=RequestMethod.POST)
	public ModelAndView addCategory(@RequestParam("catname")String catname, Model m) {
		
		
		Category category = new Category();
		category.setCategoryName(catname);
		
		categoryDao.addCategory(category);
		
		List<Category> listCategories = categoryDao.listCategories();
		m.addAttribute("categoryList", listCategories);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Category");
		return mv;
	}
	
	@RequestMapping(value ="/DeleteCategory,{categoryID}")
	public ModelAndView deleteCategory(@PathVariable("categoryID")int categoryid, Model m) {
		
		Category category =categoryDao.getCategory(categoryid);
		categoryDao.deleteCategory(category);
		
		List<Category> listCategories = categoryDao.listCategories();
		m.addAttribute("categoryList", listCategories);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("Category");
		return mv;
	}

	@RequestMapping(value ="/EditCategory,{categoryID}")
	public ModelAndView editCategory(@PathVariable("categoryID")int categoryid, Model m) {
		
		Category category =categoryDao.getCategory(categoryid);
		m.addAttribute("categoryInfo", category);
		
		List<Category> listCategories = categoryDao.listCategories();
		m.addAttribute("categoryList", listCategories);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("UpdateCategory");
		return mv;
	}

	@RequestMapping(value ="/UpdateCategory", method=RequestMethod.POST)
	public ModelAndView updateCategory(@RequestParam("catname")String catname,@RequestParam("catid")int catid, Model m) {
		
		
		Category category = categoryDao.getCategory(catid);
		category.setCategoryName(catname);
		
		categoryDao.updateCategory(category);
		
		List<Category> listCategories = categoryDao.listCategories();
		m.addAttribute("categoryList", listCategories);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Category");
		return mv;
	}
}