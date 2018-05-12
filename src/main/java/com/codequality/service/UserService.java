package com.codequality.service;

import org.springframework.stereotype.Repository;

import com.codequality.entity.User;

@Repository
public interface UserService {
    void save(User user);
    User findByUsername(String username);
   }
