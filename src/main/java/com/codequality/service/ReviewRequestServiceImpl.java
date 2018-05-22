package com.codequality.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.codequality.entity.ReviewRequest;
import com.codequality.entity.User;
import com.codequality.repository.ReviewRequestRepository;

@Service
public class ReviewRequestServiceImpl implements ReviewRequestService {
	
	@Autowired
	private ReviewRequestRepository reviewRequestRepository;
	
	/**
     * Takes a ReviewRequest model from the client and the current logged in user model in order to
     * bound the ReviewRequest to a user and save it in the database.
     */
	public void saveOpenReviewRequest(ReviewRequest reviewRequest, User user) {
		reviewRequest.setOpen(true);
		reviewRequest.setIsBroken(false);
		reviewRequest.setUser(user);
		reviewRequestRepository.save(reviewRequest);
	}
	
	 /**
     * Takes a ReviewRequest model from the client and updates an existing ReviewRequest from the database 
     * based on the requestId parameter.
     */
	public void updateReviewRequest(ReviewRequest updateData, Long requestId) {
		ReviewRequest reviewRequest = findReviewRequestById(requestId);
		reviewRequest.setOpen(false);
		if (updateData.getIsBroken() != null && updateData.getIsBroken() == true) {
			reviewRequest.setIsBroken(true);
		}
		reviewRequest.setReviewerFeedback(updateData.getReviewerFeedback());	
		reviewRequestRepository.save(reviewRequest);
	}
	
	/**
     * Returns a ReviewRequest model from the database based on the id parameter.
     */
	public ReviewRequest findReviewRequestById(Long id) {
		return reviewRequestRepository.findReviewRequestById(id);
	}
	
	/**
     * Returns a ReviewRequest model from the database based on the title parameter.
     */
	public ReviewRequest findByTitle(String title) {
		return reviewRequestRepository.findByTitle(title);
	}
	
	/**
     * Returns a list of ReviewRequest Objects with all the open ReviewRequests from the database.
     */
	public List<ReviewRequest> getAllOpenReviewRequests() {
		List<ReviewRequest> allOpenRequests = reviewRequestRepository.findAllByOpen(true);	  
	    return allOpenRequests;
	}
	 
	/**
     * Returns a list of ReviewRequest Objects with all the closed ReviewRequests from the database.
     */
	public List<ReviewRequest> getAllClosedReviewRequests() {
	   	List<ReviewRequest> allOpenRequests = reviewRequestRepository.findAllByOpen(false);	  
	   	return allOpenRequests;
	}
	
	/**
     * Checks if a ReviewRequest title is unique on a user.
     */
	public boolean isReviewRequestTitleUniqueOnUser(String title, Long userId) {
		ReviewRequest reviewRequest = findByTitle(title);
		
		if (reviewRequest != null && reviewRequest.getUser().getId() == userId) {
	   		return false;
	   	}
	   	return true;
	} 
}
