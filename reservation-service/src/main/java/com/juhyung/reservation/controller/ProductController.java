package com.juhyung.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.juhyung.reservation.domain.PageCriteria;
import com.juhyung.reservation.domain.ProductVO;
import com.juhyung.reservation.dto.DetailProduct;
import com.juhyung.reservation.dto.ProductDTO;
import com.juhyung.reservation.service.ProductService;

@RestController
@RequestMapping("/api/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("/{page}")
	public List<ProductDTO> list(@PathVariable int page) throws Exception {
		PageCriteria pageCriteria = new PageCriteria(page);
		return productService.getListPage(pageCriteria);
	}
	
	@GetMapping("/categories/{categoryId}/{page}")
	public List<ProductVO> listByCategoryId(@PathVariable Integer categoryId, @PathVariable int page) throws Exception {
		PageCriteria pageCriteria = new PageCriteria(page);
		return productService.getListByCategory(categoryId, pageCriteria);
	}
	
	@GetMapping("/count")
	public Integer countProductAll() throws Exception {
		return productService.getCountSaleProduct();
	}
	@GetMapping("/count/{id}")
	public Integer countProductByCategory(@PathVariable int id) throws Exception {
		return productService.getCountSaleProductByCategory(id);
	}
	public Integer count() throws Exception {
		return productService.getCountSaleProduct();
	}

	@GetMapping("/promotion")
	public List<ProductVO> listPromotion() throws Exception {
		return productService.getListPromotion();
	}
	
	@GetMapping("/read/{id}")
	public DetailProduct read(@PathVariable Integer id) throws Exception {
		return productService.getDetailProductById(id);
	}
}
