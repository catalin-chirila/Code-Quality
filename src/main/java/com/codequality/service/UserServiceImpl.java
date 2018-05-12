package com.codequality.service;

import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codequality.entity.User;

import com.codequality.repository.RoleRepository;
import com.codequality.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    @SuppressWarnings("unchecked")
    public void save(User user) {
        user.setPasswordHash(user.getPasswordHash());
        user.setRoles(new HashSet(roleRepository.findAll()));
        userRepository.save(user);
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
