package com.codequality.controller;

import java.security.Principal;
import java.util.ArrayList;

import org.assertj.core.util.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codequality.entity.ReviewRequest;
import com.codequality.entity.User;
import com.codequality.service.ReviewRequestImpl;
import com.codequality.service.UserService;
import com.codequality.service.UserServiceImpl;



@Controller
public class UserController {
    
    @Autowired
    private UserService userService;   
    
    @Autowired
    private UserServiceImpl userServiceImpl;
    
    @Autowired
    private ReviewRequestImpl reviewRequestImpl;
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

   
    @RequestMapping(value = {"/user/home"}, method = RequestMethod.GET)
    public String getUserHome(Model model, Principal principal) {
    	model.addAttribute("requests", userServiceImpl.getReviewRequestsByUsername(principal.getName()));
        return "/user/home";
    }
    
    @RequestMapping(value = {"/user/create/review-request"}, method = RequestMethod.GET)
    public String getUserCreateReviewRequest(Model model, Principal principal) {
    	model.addAttribute("reviewRequest", new ReviewRequest());
        return "/user/create/review-request";
    }
    
    @RequestMapping(value = {"/create-review-request"}, method = RequestMethod.PUT)
    public String createReviewRequest(@ModelAttribute("reviewRequest") ReviewRequest reviewRequest, Principal principal, BindingResult result) {
    	User user = userServiceImpl.findByUsername(principal.getName());
    	reviewRequest.setUser(user);
    	reviewRequestImpl.save(reviewRequest);
        return "redirect:/user/home";
    }
}
