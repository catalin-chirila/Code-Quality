package com.codequality.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.codequality.entity.ReviewRequest;
import com.codequality.entity.Role;
import com.codequality.entity.User;

import com.codequality.repository.RoleRepository;
import com.codequality.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    public void save(User user, String role) {
    	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(user.getPasswordHash());
        user.setPasswordHash(hashedPassword);          
    	
    	if (role.equals("user")) { 	         
    		Set<Role> roles = new HashSet<>();           
            roles.add(roleRepository.findByName("USER"));
            user.setRoles(roles);      
            userRepository.save(user);
    	} else if (role.equals("reviewer")) {
    		Set<Role> roles = new HashSet<>();           
            roles.add(roleRepository.findByName("REVIEWER"));
            user.setRoles(roles);      
            userRepository.save(user);
    	}  	
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    public List<ReviewRequest> getOpenReviewRequestsByUsername(String username) {
    	List<ReviewRequest> requests = userRepository.findByUsername(username).getReviewRequests().stream().collect(Collectors.toList());
    	List<ReviewRequest> openRequests = new ArrayList<>();
    	
    	for (ReviewRequest request : requests) {
    		if (request.getOpen()) {
    			openRequests.add(request);
    		}
    	}
    	return openRequests;
    }
    
    public List<ReviewRequest> getClosedReviewRequestsByUsername(String username) {
    	List<ReviewRequest> requests = userRepository.findByUsername(username).getReviewRequests().stream().collect(Collectors.toList());
    	List<ReviewRequest> closedRequests = new ArrayList<>();
    	
    	for (ReviewRequest request : requests) {
    		if (!request.getOpen()) {
    			closedRequests.add(request);
    		}
    	}
    	return closedRequests;
    }
}
