package com.hmis.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hmis.domain.ReplyVO;
import com.hmis.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	@Inject
	private ReplyService service;
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);


	// 1. 관리자, 학생 :: QnA - 댓글 생성 
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO revo) {
	    ResponseEntity<String> entity = null;
	    
	    
	    try {
	        service.add(revo);
	        entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	        
	    	logger.info("reply get.,...........");
	    }
	    return entity;
	    
	}
	
	


	
	// 2. 관리자, 학생 ::  QnA - 댓글 삭제
	@RequestMapping(value = "/{replyNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(
			@PathVariable("replyNo") int replyNo) {
		
	    ResponseEntity<String> entity = null;
	    try {
	        service.remove(replyNo);
	        entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(
	        		e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	
	
	// 3 .관리자, 학생 :: QnA - 댓글 전체 보기 
	@RequestMapping(value = "/all/{qnaNo}", method = {RequestMethod.GET,RequestMethod.POST})
	public ResponseEntity<List<ReplyVO>> list(
			@PathVariable("qnaNo") int qnaNo) {
	    ResponseEntity<List<ReplyVO>> entity = null;
	    try {
	        entity = new ResponseEntity<>(service.list(qnaNo), HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}
	


	
}
