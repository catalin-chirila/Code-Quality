package com.codequality.controller;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.codequality.entity.ReviewRequest;
import com.codequality.entity.User;
import com.codequality.service.ReviewRequestImpl;
import com.codequality.service.UserServiceImpl;

@Controller
public class ReviewerController {
	
	@Autowired
    private UserServiceImpl userServiceImpl;
	
	@Autowired
    private ReviewRequestImpl reviewRequestImpl;
	
	@RequestMapping(value = "/reviewer/home", method = RequestMethod.GET)
    public String getHomePage() {
        return "/reviewer/home";
    }
	
	@RequestMapping(value = {"/reviewer/request/open/{id}"}, method = RequestMethod.GET)
    public String getIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestImpl.findReviewRequestById(requestId));
        return "/reviewer/requests/view-open-request";
    }
	
	@RequestMapping(value = {"/reviewer/request/closed/{id}"}, method = RequestMethod.GET)
    public String getSolvedIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestImpl.findReviewRequestById(requestId));
        return "/reviewer/requests/view-closed-request";
    }

	@RequestMapping(value = {"/reviewer/requests/open/all"}, method = RequestMethod.GET)
    public String getClosedReviewRequests(Model model) {
    	model.addAttribute("requests", reviewRequestImpl.getAllOpenReviewRequests());
        return "/reviewer/requests/view-all-open-requests";
    }
	
	@RequestMapping(value = {"/reviewer/requests/closed/all"}, method = RequestMethod.GET)
    public String getClosedReviewRequests(Model model, Principal principal) {
    	model.addAttribute("requests", userServiceImpl.getClosedReviewRequestsByUsername(principal.getName()));
        return "/reviewer/requests/view-all-closed-requests";
    }
	
	@RequestMapping(value = {"/update-review-request/{id}"}, method = RequestMethod.POST)
    public String createReviewRequest(@PathVariable(value = "id") Long requestId, @ModelAttribute("individualRequest") ReviewRequest updateData, BindingResult result) {
		reviewRequestImpl.updateReviewRequest(updateData, updateData.getId());
        return "redirect:/reviewer/requests/view-all-open-requests";
    }
	
	@RequestMapping(value = {"/reviewer/profile/edit"}, method = RequestMethod.GET)
    public String getUserProfile(Model model, Principal principal) {
    	model.addAttribute("currentUser", userServiceImpl.findByUsername(principal.getName()));
    	model.addAttribute("updateUser", new User());
        return "/reviewer/profile";
    }
    
}

