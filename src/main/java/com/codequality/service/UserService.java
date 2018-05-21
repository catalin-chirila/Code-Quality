package com.codequality.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.codequality.entity.ReviewRequest;
import com.codequality.entity.User;

public interface UserService {
    void save(User user, String role);
    void update(User updateUser, String username);
    User findByUsername(String username);
    User findByEmail(String email);
    List<ReviewRequest> getOpenReviewRequestsByUsername(String username);
    List<ReviewRequest> getClosedReviewRequestsByUsername(String username);
    boolean isUsernameUnique(String username);
    boolean isEmailUnique(String email); 
 }
