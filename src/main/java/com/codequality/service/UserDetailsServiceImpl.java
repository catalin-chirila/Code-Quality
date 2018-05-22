package com.codequality.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.codequality.entity.Role;
import com.codequality.entity.User;
import com.codequality.repository.UserRepository;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
    @Autowired
    private UserRepository userRepository;
    
    static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    /**
     * Is used to log in the user and add it's roles to the Spring Security User.
     * This implementation allows the application to limit access to certain pages based on the user's role.
     */
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        
        if (user == null) {
        	throw new UsernameNotFoundException("Username not found: " + username);
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet();
        for (Role role : user.getRoles()){
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
        }

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPasswordHash(), grantedAuthorities);
    }
}

