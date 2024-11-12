package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;

import com.spring_boot_dolls_ticket.project.model.ReviewVO;

public interface IReviewService {

	public void insertReview(ReviewVO vo);
	public ArrayList<ReviewVO> reviewList(String performanceId);
	public void deleteReview(int reviewSeq);
}
