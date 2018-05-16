package com.codequality.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codequality.entity.ReviewRequest;

@Repository
public interface ReviewRequestRepository extends JpaRepository <ReviewRequest, Long> {
	ReviewRequest findReviewRequestById(Long id);
	List<ReviewRequest> findAllByOpen(Boolean open);
}
