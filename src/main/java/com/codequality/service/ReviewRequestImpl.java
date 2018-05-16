package com.codequality.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codequality.entity.ReviewRequest;
import com.codequality.entity.User;
import com.codequality.repository.ReviewRequestRepository;

@Service
public class ReviewRequestImpl {
	
	@Autowired
	private ReviewRequestRepository reviewRequestRepository;
	
	public void saveOpenReviewRequest(ReviewRequest reviewRequest, User user) {
		reviewRequest.setOpen(true);
		reviewRequest.setIsBroken(false);
		reviewRequest.setUser(user);
		reviewRequestRepository.save(reviewRequest);
	}
	
	public ReviewRequest findReviewRequestById(Long id) {
		return reviewRequestRepository.findReviewRequestById(id);
	}
	
	public void updateReviewRequest(ReviewRequest updateData, Long requestId) {
		ReviewRequest reviewRequest = findReviewRequestById(requestId);
		reviewRequest.setOpen(false);
		if (updateData.getIsBroken() != null && updateData.getIsBroken() == true) {
			reviewRequest.setIsBroken(true);
		}
		reviewRequest.setReviewerFeedback(updateData.getReviewerFeedback());	
		reviewRequestRepository.save(reviewRequest);
	}
	
	 public List<ReviewRequest> getAllOpenReviewRequests() {
	    	List<ReviewRequest> allOpenRequests = reviewRequestRepository.findAllByOpen(true);	  
	    	return allOpenRequests;
	    }
}
