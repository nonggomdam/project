package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_dolls_ticket.project.dao.IReviewDAO;
import com.spring_boot_dolls_ticket.project.model.ReviewVO;

@Service
public class ReviewService implements IReviewService{

	@Autowired
	@Qualifier("IReviewDAO")
	IReviewDAO dao;

	@Override
	public void insertReview(ReviewVO vo) {
		dao.insertReview(vo);		
	}

	@Override
	public ArrayList<ReviewVO> reviewList(String performanceId) {
		return dao.reviewList(performanceId);
	}

	@Override
	public void deleteReview(int reviewSeq) {
		dao.deleteReview(reviewSeq);
	}

}
