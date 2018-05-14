package com.codequality.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codequality.entity.ReviewRequest;
import com.codequality.repository.ReviewRequestRepository;

@Service
public class ReviewRequestImpl {
	
	@Autowired
	private ReviewRequestRepository reviewRequestRepository;
	
	public void save(ReviewRequest reviewRequest) {
		reviewRequestRepository.save(reviewRequest);
	}
}
