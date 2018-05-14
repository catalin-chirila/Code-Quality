package com.codequality.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.codequality.entity.ReviewRequest;

public interface ReviewRequestRepository extends JpaRepository <ReviewRequest, Long> {
	
}
