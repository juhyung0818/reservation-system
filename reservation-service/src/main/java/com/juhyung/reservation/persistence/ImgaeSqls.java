package com.juhyung.reservation.persistence;

public class ImgaeSqls {
	
	static final String SELECT_IMAGE_BY_PRODUCT_ID = 
			"select f.* from file as f, product_image as p where f.id=p.file_id and p.product_id= :product_id";
	static final String SELECT_MAIN_IMAGE_OF_PRODUCT =
			"select * from product_image where type=1 and product_id= :product_id";
	static final String SELECT_IMAGE_BY_FILE =
			"select * from file where id= :file_id";
	
}
