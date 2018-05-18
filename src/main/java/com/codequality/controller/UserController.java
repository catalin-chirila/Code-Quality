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
import org.springframework.web.bind.annotation.RequestParam;

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
            model.addAttribute("error", "Your username or password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
    
    @PreAuthorize("hasAuthority('USER')")
    @RequestMapping(value = "/user/home", method = RequestMethod.GET)
    public String getHomePage() {
        return "/user/home";
    }
    
    @PreAuthorize("hasAuthority('USER')")
    @RequestMapping(value = {"/user/request/open/{id}"}, method = RequestMethod.GET)
    public String getOpenIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestImpl.findReviewRequestById(requestId));
        return "/user/requests/view-open-request";
    }
    
    @PreAuthorize("hasAuthority('USER')")
    @RequestMapping(value = {"/user/request/closed/{id}"}, method = RequestMethod.GET)
    public String getSolvedIndividualReviewRequest(@PathVariable(value = "id") Long requestId, Model model, Principal principal) {
		model.addAttribute("individualRequest", reviewRequestImpl.findReviewRequestById(requestId));
        return "/user/requests/view-closed-request";
    }
   
    @PreAuthorize("hasAuthority('USER')")
    @RequestMapping(value = {"/user/requests/open/all"}, method = RequestMethod.GET)
    public String getUserHome(Model model, Principal principal) {
    	model.addAttribute("requests", userServiceImpl.getOpenReviewRequestsByUsername(principal.getName()));
        return "/user/requests/view-all-open-requests";
    }
    
    @PreAuthorize("hasAuthority('USER')")
    @RequestMapping(value = {"/user/requests/closed/all"}, method = RequestMethod.GET)
    public String getClosedReviewRequests(Model model, Principal principal) {
    	model.addAttribute("requests", userServiceImpl.getClosedReviewRequestsByUsername(principal.getName()));
        return "/user/requests/view-all-closed-requests";
    }
	
    @PreAuthorize("hasAuthority('USER')")
    @RequestMapping(value = {"/user/requests/create"}, method = RequestMethod.GET)
    public String getUserCreateReviewRequest(Model model) {
    	model.addAttribute("reviewRequest", new ReviewRequest());
        return "/user/requests/create-request";
    }
    
    @PreAuthorize("hasAuthority('USER')")
    @RequestMapping(value = {"/create/request"}, method = RequestMethod.PUT)
    public String createReviewRequest(@ModelAttribute("reviewRequest") ReviewRequest reviewRequest, Principal principal, BindingResult result) {
    	User user = userServiceImpl.findByUsername(principal.getName());
    	reviewRequestImpl.saveOpenReviewRequest(reviewRequest, user);
        return "redirect:/user/requests/view-all-open-requests";
    } 
    
    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String register(Model model) {
    	model.addAttribute("user", new User());
        return "/register";
    }
    
    @RequestMapping(value = {"/create/user"}, method = RequestMethod.PUT)
    public String createNewUser(@RequestParam String role, @ModelAttribute("user") User user, BindingResult result) {
    	userServiceImpl.save(user, role);
        return "redirect:/login";
    } 
    
    
}
