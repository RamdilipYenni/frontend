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

import com.niit.dao.CustomerDao;
import com.niit.model.Customer;

@Controller
public class CustomerController {
	private static final String Customerid = null;
	@Autowired
	CustomerDao customerDao;
	
	@RequestMapping(value ="/customer")
	public ModelAndView supplierPage(Model m) {
		
		List<Customer> listCustomers = CustomerDao.listCustomers();
		m.addAttribute("customerList", listCustomers);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Customer");
		return mv;
	}
	
	@RequestMapping(value ="/InsertCustomer", method=RequestMethod.POST)
	public ModelAndView addCustomer(@RequestParam("cusname")String cusname,@RequestParam("cusadd")String cusadd, Model m) {
		
		Customer customer = new Customer();
		customer.setcustomerName(cusname);
		customer.setcustomerAddress(cusadd);
		
		customerDao.addCustomer(customer);
		
		List<Customer> listCustomers = CustomerDao.listCustomers();
		m.addAttribute("customerList", listCustomers);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Customer");
		return mv;
	}
	
	@RequestMapping(value ="/DeleteCustomer,{customerID}")
	public ModelAndView deleteCustomer(@PathVariable("customerID")int supplierid, Model m) {
		
		Customer customer = Customer.getCustomer(Customerid);
		customerDao.deleteCustomer(customer);
		
		List<Customer> listCustomers = CustomerDao.listCustomers();
		m.addAttribute("customerList", listCustomers);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("Customer");
		return mv;
	}

	@RequestMapping(value ="/EditCustomer,{customerID}")
	public ModelAndView editCustomer(@PathVariable("customerID")int customerid, Model m) {
		
		Customer customer = CustomerDao.getCustomer(Customerid);
		m.addAttribute("CustomerInfo", customer);
		
		List<Customer> listCustomer = customerDao.listCustomer();
		Object listCustomers = null;
		m.addAttribute("customerList", listCustomers);
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("UpdateCustomer");
		return mv;
	}

	@RequestMapping(value ="/UpdateCustomer", method=RequestMethod.POST)
	public ModelAndView updateCustomer(@RequestParam("cusname")String cusname,@RequestParam("cusid")int cusid,@RequestParam("cusadd")String supadd, Model m, String cusadd) {
		
		
		Customer customer = customerDao.getCustomer(cusid);
		Customer.setcustomerName(cusname);
		Customer.setcustomerAddress(cusadd);
		
		customerDao.updateCustomer(customerDao);
		
		List<Customer> listCustomers = CustomerDao.listCustomers();
		m.addAttribute("CustomerList", listCustomers);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Customer");
		return mv;
	}

}