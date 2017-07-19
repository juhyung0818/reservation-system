package com.juhyung.resrvation.persistence;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;
import org.assertj.core.api.AssertDelegateTarget;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.juhyung.reservation.config.RootApplicationContextConfig;
import com.juhyung.reservation.persistence.CommentDAO;
import com.juhyung.reservation.persistence.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = RootApplicationContextConfig.class)
public class TestProductDAO {
	
	@Autowired
	private CommentDAO commentDao;
	
	@Test
	public void testComments(){
		if(commentDao.selectCommentByProductId(2).size() > 0){
			System.out.println("hello");
		}
	private ProductDAO productDao;
	
	
}
