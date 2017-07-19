package com.juhyung.reservation.persistence;

import java.util.List;

import com.juhyung.reservation.domain.Image;
import com.juhyung.reservation.domain.ProductImage;

public interface ImageDAO {

	public int insertImage(Image image);
	public int insertImageProduct(ProductImage productImage);
	public List<Image> selectImageByProductId(Integer productId);
	public Image selectMainImageOfProduct(Integer productId);
	public Image selectImageByFileId(Integer fileId);
}
