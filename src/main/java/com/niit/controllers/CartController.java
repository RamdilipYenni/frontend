package com.niit.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.*;
import com.niit.model.Cart;
import com.niit.model.Product;
import com.niit.DaoImplements.*;

@Controller
public class CartController {
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	CartDao cartDao;
	
	@RequestMapping(value="/cart")
	public String cartPage(HttpSession session,Model m) {
		
		String username = (String)session.getAttribute("username");
		
		List<Cart> listCartItems = cartDao.listCartItems(username);
		m.addAttribute("listItems",listCartItems);
		
		m.addAttribute("totalPayment",this.calcTotalAmount(listCartItems));
		
		return "Cart";
	}
	
	@RequestMapping(value="/addToCart,{productId}")
	public String addToCart(@PathVariable("productId")int productid,@RequestParam("quantity")int quantity,HttpSession session,Model m) {
		String username=((String)session.getAttribute("username"));
		
		if ((String)session.getAttribute("username")!=null) {
		Cart cart = new Cart();
		Product product = productDao.getProduct(productid);
		cart.setProductId(productid);
		cart.setProductName(product.getProductName());
		cart.setPrice(product.getPrice());
		cart.setQuantity(quantity);
		cart.setStatus("NP");
		cart.setUserName((String)session.getAttribute("username"));
		
		cartDao.addToCart(cart);
		
		List<Cart> listCartItems = cartDao.listCartItems(username);
		m.addAttribute("listItems",listCartItems);
		m.addAttribute("totalPayment",this.calcTotalAmount(listCartItems));
		
		return "Cart";
		}
		else {
			return "Login";
		}		
	}
	
	@RequestMapping(value="/updateItem,{cartId}")
	public String update(@PathVariable("cartId")int cartId,@RequestParam("quantity")int quantity,Model m,HttpSession session) {
		String username=((String)session.getAttribute("username"));
		
		Cart cart = cartDao.getCart(cartId);
		cart.setQuantity(quantity);
		cartDao.updateFromCart(cart);
		
		List<Cart> listCartItems = cartDao.listCartItems(username);
		m.addAttribute("listItems",listCartItems);
		
		m.addAttribute("totalPayment",this.calcTotalAmount(listCartItems));
		return "Cart";
		
	}
	
	@RequestMapping(value="/deleteItem,{cartId}")
	public String delete(@PathVariable("cartId")int cartId,Model m,HttpSession session) {
		
		String username=((String)session.getAttribute("username"));

		Cart cart = cartDao.getCart(cartId);
		
		cartDao.deleteFromCart(cart);
		
		List<Cart> listCartItems = cartDao.listCartItems(username);
		m.addAttribute("listItems",listCartItems);
		
		m.addAttribute("totalPayment",this.calcTotalAmount(listCartItems));
		return "Cart";
		
	}
	
	public int calcTotalAmount(List<Cart> cartItems) {
		int item=0,totalAmount=0;
		while(item<cartItems.size()) {
			Cart cart = cartItems.get(item);
			totalAmount = totalAmount+(cart.getPrice()*cart.getQuantity());
			item++;
		}
		return totalAmount;
	}
}