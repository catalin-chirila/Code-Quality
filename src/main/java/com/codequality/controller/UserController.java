package com.codequality.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.codequality.entity.ReviewRequest;
import com.codequality.entity.User;
import com.codequality.service.ReviewRequestServiceImpl;
import com.codequality.service.UserService;
import com.codequality.service.UserServiceImpl;

@Controller
public class UserController {
    
    /*@Autowired
    private UserService userService;  */ 
    
    @Autowired
    private UserServiceImpl userServiceImpl;
    
    @Autowired
    private ReviewRequestServiceImpl reviewRequestServiceImpl;
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username or password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
    
    @RequestMapping(value = "/user/home", method = RequestMethod.GET)
    public String getHomePage() {
        return "/user/home";
    }
    
    @RequestMapping(value = {"/user/request/open/{id}"}, method = RequestMethod.GET)
    public String getOpenIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestServiceImpl.findReviewRequestById(requestId));
        return "/user/requests/view-open-request";
    }
    
    @RequestMapping(value = {"/user/request/closed/{id}"}, method = RequestMethod.GET)
    public String getSolvedIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestServiceImpl.findReviewRequestById(requestId));
        return "/user/requests/view-closed-request";
    }
   
    @RequestMapping(value = {"/user/requests/open/all"}, method = RequestMethod.GET)
    public String getUserHome(Model model, Principal principal) {
    	model.addAttribute("requests", userServiceImpl.getOpenReviewRequestsByUsername(principal.getName()));
        return "/user/requests/view-all-open-requests";
    }
    
    @RequestMapping(value = {"/user/requests/closed/all"}, method = RequestMethod.GET)
    public String getClosedReviewRequests(Model model, Principal principal) {
    	model.addAttribute("requests", userServiceImpl.getClosedReviewRequestsByUsername(principal.getName()));
        return "/user/requests/view-all-closed-requests";
    }
	
    @RequestMapping(value = {"/user/requests/create"}, method = RequestMethod.GET)
    public String getUserCreateReviewRequest(Model model) {
    	model.addAttribute("reviewRequest", new ReviewRequest());
        return "/user/requests/create-request";
    }
    
    @RequestMapping(value = {"/create/request"}, method = RequestMethod.POST)
    public String createReviewRequest(@Valid @ModelAttribute("reviewRequest") ReviewRequest reviewRequest, BindingResult bindingResult, Principal principal) {
    	if (bindingResult.hasErrors()) {
			return "/user/requests/create-request";
		}
    	
    	if (!reviewRequestServiceImpl.isReviewRequestUnique(reviewRequest.getTitle())) {
    		bindingResult.rejectValue("title", "error.reviewRequest", "A review request already exists for this title.");
    		return "/user/requests/create-request";
    	}
    	
    	User user = userServiceImpl.findByUsername(principal.getName());
    	reviewRequestServiceImpl.saveOpenReviewRequest(reviewRequest, user);
        return "redirect:/user/requests/open/all";
    } 
    
    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String register(Model model) {
    	model.addAttribute("user", new User());
        return "/register";
    }
    
    @RequestMapping(value = {"/create/user"}, method = RequestMethod.POST)
    public String createNewUser(@RequestParam String role, @Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
    	if (bindingResult.hasErrors()) {
			return "/register";
		}
    	
    	if (!userServiceImpl.isUsernameUnique(user.getUsername())) {
    		bindingResult.rejectValue("username", "error.user", "An account already exists for this username.");
    		return "/register";
    	}
    	
    	if (!userServiceImpl.isEmailUnique(user.getEmail())) {
    		bindingResult.rejectValue("email", "error.user", "An account already exists for this email.");
    		return "/register";
    	}
     	
    	userServiceImpl.save(user, role);
    	return "redirect:/login";
    } 
    
    @RequestMapping(value = {"/user/profile/edit"}, method = RequestMethod.GET)
    public String getUserProfile(Model model, Principal principal) {
    	model.addAttribute("currentUser", userServiceImpl.findByUsername(principal.getName()));
    	model.addAttribute("updateUser", new User());
        return "/user/profile";
    }
    
    @RequestMapping(value = {"/profile/edit"}, method = RequestMethod.POST)
    public String editProfile(@ModelAttribute("updateUser") User updateData, Principal principal) {
    	userServiceImpl.update(updateData, principal.getName());
        return "redirect:/user/profile/edit";
    }
    
}
