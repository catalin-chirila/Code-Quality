package com.codequality.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
@Table(name = "review_request")
public class ReviewRequest {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    
    @Size(min = 1, max = 40, message = "Please enter a title.")
    @Column(name = "title")
    private String title;
    
    @Size(min = 1, max = 500, message = "Please enter a description.")
    @Column(name = "description")
    private String description;
    
    @Column(name = "open")
    private Boolean open;
    
    @Column(name = "is_broken")
    private Boolean isBroken;
    
    @Size(min = 1, max = 500, message = "Please enter some feedback.")
    @Column(name = "reviewer_feedback")
    private String reviewerFeedback;
    
    @Size(min = 1, max = 255, message = "Please enter the repository link.")
    @Column(name = "repository_link")
    private String repositoryLink;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    
    public ReviewRequest() {
        
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    public Boolean getIsBroken() {
        return isBroken;
    }

    public void setIsBroken(Boolean isBroken) {
        this.isBroken = isBroken;
    }

    public String getReviewerFeedback() {
        return reviewerFeedback;
    }

    public void setReviewerFeedback(String reviewerFeedback) {
        this.reviewerFeedback = reviewerFeedback;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

	public String getRepositoryLink() {
		return repositoryLink;
	}

	public void setRepositoryLink(String repositoryLink) {
		this.repositoryLink = repositoryLink;
	}
    
}
