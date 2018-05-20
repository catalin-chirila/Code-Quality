package com.codequality.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
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
    	
    	if (role.equals("USER")) { 	         
    		Set<Role> roles = new HashSet<>();           
            roles.add(roleRepository.findByName("USER"));
            user.setRoles(roles);      
            userRepository.save(user);
    	} else if (role.equals("REVIEWER")) {
    		Set<Role> roles = new HashSet<>();           
            roles.add(roleRepository.findByName("REVIEWER"));
            user.setRoles(roles);      
            userRepository.save(user);
    	}  	
    }
    
    public void update(User updateUser, String username) {
    	
    	User currentUser = findByUsername(username);
    	
    	
    	if (updateUser.getUsername() != null && !updateUser.getUsername().isEmpty()) {
    		currentUser.setUsername(updateUser.getUsername());
        	Set<GrantedAuthority> grantedAuthorities = new HashSet();
        	for (Role role : currentUser.getRoles()){
        		grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
        	}
        	Authentication authentication = new PreAuthenticatedAuthenticationToken(currentUser.getUsername(), currentUser.getPasswordHash(), grantedAuthorities);
        	SecurityContextHolder.getContext().setAuthentication(authentication);
    	}
    	
    	if (updateUser.getEmail() != null && !updateUser.getEmail().isEmpty()) {
    		currentUser.setEmail(updateUser.getEmail());
    	}
    	
    	if (updateUser.getFirstName() != null && !updateUser.getFirstName().isEmpty()) {
    		currentUser.setFirstName(updateUser.getFirstName());
    	}
    	
    	if (updateUser.getPasswordHash() != null && !updateUser.getPasswordHash().isEmpty()) {
    		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String hashedPassword = passwordEncoder.encode(updateUser.getPasswordHash());
    		currentUser.setPasswordHash(hashedPassword);
    	}
    	
    	if (updateUser.getLastName() != null && !updateUser.getLastName().isEmpty()) {
    		currentUser.setLastName(updateUser.getLastName());
    	}
    	
    	if (updateUser.getBio() != null && !updateUser.getBio().isEmpty()) {
    		currentUser.setBio(updateUser.getBio());
    	}
    	
    	userRepository.save(currentUser);	

    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
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
    
    public boolean isUsernameUnique(String username) {
    	if (findByUsername(username) != null) {
    		return false;
    	}
    	return true;
    }
    
    public boolean isEmailUnique(String email) {
    	if (findByEmail(email) != null) {
    		return false;
    	}
    	return true;
    }
}
