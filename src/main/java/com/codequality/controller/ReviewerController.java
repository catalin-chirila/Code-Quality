package com.codequality.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.codequality.entity.ReviewRequest;
import com.codequality.entity.User;
import com.codequality.service.ReviewRequestServiceImpl;
import com.codequality.service.UserServiceImpl;

@Controller
public class ReviewerController {
	
	@Autowired
    private UserServiceImpl userServiceImpl;
	
	@Autowired
    private ReviewRequestServiceImpl reviewRequestServiceImpl;
	
	@RequestMapping(value = "/reviewer/home", method = RequestMethod.GET)
    public String getHomePage() {
        return "/reviewer/home";
    }
	
	@RequestMapping(value = {"/reviewer/request/open/{id}"}, method = RequestMethod.GET)
    public String getIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestServiceImpl.findReviewRequestById(requestId));
        return "/reviewer/requests/view-open-request";
    }
	
	@RequestMapping(value = {"/reviewer/request/closed/{id}"}, method = RequestMethod.GET)
    public String getSolvedIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestServiceImpl.findReviewRequestById(requestId));
        return "/reviewer/requests/view-closed-request";
    }

	@RequestMapping(value = {"/reviewer/requests/open/all"}, method = RequestMethod.GET)
    public String getClosedReviewRequests(Model model) {
    	model.addAttribute("requests", reviewRequestServiceImpl.getAllOpenReviewRequests());
        return "/reviewer/requests/view-all-open-requests";
    }
	
	@RequestMapping(value = {"/reviewer/requests/closed/all"}, method = RequestMethod.GET)
    public String getClosedReviewRequests(Model model, Principal principal) {
    	model.addAttribute("requests", reviewRequestServiceImpl.getAllClosedReviewRequests());
        return "/reviewer/requests/view-all-closed-requests";
    }
	
	@RequestMapping(value = {"/update/request/{id}"}, method = RequestMethod.POST)
    public String createReviewRequest(@PathVariable(value = "id") Long requestId, @ModelAttribute("individualRequest") ReviewRequest updateData) {
		
		reviewRequestServiceImpl.updateReviewRequest(updateData, updateData.getId());
        return "redirect:/reviewer/requests/open/all";
    }
	
	@RequestMapping(value = {"/reviewer/profile/edit"}, method = RequestMethod.GET)
    public String getUserProfile(Model model, Principal principal) {
    	model.addAttribute("currentUser", userServiceImpl.findByUsername(principal.getName()));
    	model.addAttribute("updateUser", new User());
        return "/reviewer/profile";
    }
	
	@RequestMapping(value = {"/reviewer/edit"}, method = RequestMethod.POST)
    public String editProfile(@Valid @ModelAttribute("updateUser") User updateData, BindingResult bindingResult, Principal principal, Model model) { 
    	
		if (!userServiceImpl.isUsernameUnique(updateData.getUsername())) {
    		model.addAttribute("currentUser", userServiceImpl.findByUsername(principal.getName()));
        	model.addAttribute("updateUser", new User());
        	model.addAttribute("usernameerror", "An account already exists for that username.");
    		return "/user/profile";
    	}
    	
    	if (!userServiceImpl.isEmailUnique(updateData.getEmail())) {
    		model.addAttribute("currentUser", userServiceImpl.findByUsername(principal.getName()));
        	model.addAttribute("updateUser", new User());
        	model.addAttribute("emailerror", "An account already exists for that email.");	
    		return "/user/profile";
    	}
    	
    	userServiceImpl.update(updateData, principal.getName());
        return "redirect:/user/profile/edit";
    }
    
}

