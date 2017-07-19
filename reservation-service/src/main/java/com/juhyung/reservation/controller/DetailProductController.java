package com.juhyung.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.juhyung.reservation.dto.DetailProduct;
import com.juhyung.reservation.persistence.ProductDAO;
import com.juhyung.reservation.service.ProductService;

@RestController
@RequestMapping("/api/detail")
public class DetailProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("/{id}")
	public DetailProduct read(@PathVariable int id){
		return productService.getDetailProductById(id);
	}
}
