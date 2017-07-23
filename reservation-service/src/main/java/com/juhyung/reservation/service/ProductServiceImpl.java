package com.juhyung.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.juhyung.reservation.domain.PageCriteria;
import com.juhyung.reservation.domain.ProductVO;
import com.juhyung.reservation.dto.DetailProduct;
import com.juhyung.reservation.dto.ProductDTO;
import com.juhyung.reservation.persistence.ImageDAO;
import com.juhyung.reservation.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{

	private ProductDAO productDao;
	private ImageDAO imageDao;
	
	@Autowired
	public ProductServiceImpl(ProductDAO productDao, ImageDAO imageDao) {
		this.productDao = productDao;
		this.imageDao = imageDao;
	}
	
	@Override
	public List<ProductDTO> getListPage(PageCriteria pageCriteria) {
		return productDao.selectListPage(pageCriteria);
	}

	@Override
	public List<ProductDTO> getListByCategory(Integer categoryId, PageCriteria pageCriteria) {
		return productDao.selectListByCategory(categoryId, pageCriteria);
	}


	@Override
	public Integer getCountSaleProduct() {
		return productDao.countOfSaleProduct();
	}
	
	@Override
	public Integer getCountSaleProductByCategory(int id) {
		return productDao.countOfSaleProductByCategoryId(id);
	}

	@Override
	public List<ProductVO> getListPromotion() {
		return productDao.selectListPromotion();
	}

	@Override
	public DetailProduct getDetailProductById(Integer id) {
		return productDao.selectDetailProductById(id);
	}

	//image
	@Override
	public List<Integer> getImagesByProduct(int id) {
		List<Integer> list = imageDao.selectImagesByProductId(id);
		return list;
	}
}
