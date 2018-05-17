package com.codequality.service;

import org.springframework.stereotype.Repository;

import com.codequality.entity.User;

@Repository
public interface UserService {
    void save(User user, String role);
    User findByUsername(String username);
 }
