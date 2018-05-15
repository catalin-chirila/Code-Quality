package com.codequality.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.codequality.entity.ReviewRequest;

@Repository
public interface ReviewRequestRepository extends JpaRepository <ReviewRequest, Long> {
	ReviewRequest findReviewRequestById(Long id);
}
