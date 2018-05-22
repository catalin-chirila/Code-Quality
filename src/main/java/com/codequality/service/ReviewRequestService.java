package com.codequality.service;

import java.util.List;

import com.codequality.entity.ReviewRequest;
import com.codequality.entity.User;

public interface ReviewRequestService {
	void saveOpenReviewRequest(ReviewRequest reviewRequest, User user);
	void updateReviewRequest(ReviewRequest updateData, Long requestId);
	ReviewRequest findReviewRequestById(Long id);
	ReviewRequest findByTitle(String title);
	List<ReviewRequest> getAllOpenReviewRequests();
	List<ReviewRequest> getAllClosedReviewRequests();
	boolean isReviewRequestTitleUniqueOnUser(String title, Long userId);
}
