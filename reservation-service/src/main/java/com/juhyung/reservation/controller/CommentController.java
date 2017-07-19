package com.juhyung.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.juhyung.reservation.domain.Comment;
import com.juhyung.reservation.domain.PageCriteria;
import com.juhyung.reservation.service.CommentService;

@RestController
@RequestMapping("/api/comments")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@GetMapping("/{id}")
	public List<Comment> getComments(@PathVariable int id){
		return commentService.getCommentByProduct(id);
	}
	
	//paging처리
	@GetMapping("/sample/{id}")
	public List<Comment> getSampleComments(@PathVariable int id){
		PageCriteria pageCriteria = new PageCriteria(1, 3);
		return commentService.getSampleComment(id, pageCriteria);
	}
	
	@GetMapping("/count/{id}")
	public int getCountComment(@PathVariable int id){
		return commentService.getCountComments(id);
	}
	
	@GetMapping("/score/{id}")
	public Double getAverageScore(@PathVariable int id){
		return	commentService.getAverageComments(id);
	}
	
	
}
