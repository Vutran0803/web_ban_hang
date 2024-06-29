package com.fpoly.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	HttpServletRequest request;
	
	
	@GetMapping("/thongke")
	public String ShowThongke(Model model) {
		model.addAttribute("showPage","admin/thongke.jsp");
		return "Admin";
		
	
}
	@GetMapping("/users")
	public String ShowUser(Model model) {
		model.addAttribute("showPage","admin/user.jsp");
		return "Admin";
		
	
}
	@GetMapping("/products")
	public String ShowProduct(Model model) {
		model.addAttribute("showPage","admin/product.jsp");
		return "Admin";
		
	
}
	@GetMapping("/orders")
	public String ShowOders(Model model) {
		model.addAttribute("showPage","admin/oder.jsp");
		return "Admin";
		
	
}
	@GetMapping ("/upload")
	public String showupload() {
		return "uploadfile";
	}
	
	
}
	
	
	


