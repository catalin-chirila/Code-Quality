package com.codequality.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codequality.entity.ReviewRequest;
import com.codequality.service.ReviewRequestImpl;
import com.codequality.service.UserServiceImpl;

@Controller
public class ReviewerController {
	
	@Autowired
    private UserServiceImpl userServiceImpl;
	
	@Autowired
    private ReviewRequestImpl reviewRequestImpl;

//	@PreAuthorize("hasAuthority('REVIEWER')")
	@RequestMapping(value = {"/reviewer/home"}, method = RequestMethod.GET)
    public String getClosedReviewRequests(Model model, Principal principal) {
    	model.addAttribute("requests", userServiceImpl.getOpenReviewRequestsByUsername(principal.getName()));
        return "/reviewer/home";
    }
	
	@RequestMapping(value = {"/reviewer/request/{id}"}, method = RequestMethod.GET)
    public String getIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestImpl.findReviewRequestById(requestId));
        return "/reviewer/requests/individual";
    }
}

