package com.juhyung.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.juhyung.reservation.domain.CategoryVO;
import com.juhyung.reservation.service.CategoryService;

@RestController
@RequestMapping("/rest/category")
public class RestCategoryController {

	@Autowired
	private CategoryService categoryService;
	
}
