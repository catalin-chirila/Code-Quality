package com.codequality.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    
    @Size(min = 5, max = 30, message = "Please enter between {min} and {max} characters.")
    @Column(name = "username")
    private String username;
    
    @Email
    @Size(min = 1, max = 40, message = "Please enter an email.")
    @Column(name = "email")
    private String email;
    
    @Size(min = 6, max = 255, message = "Please enter between {min} and {max} characters.")
    @Column(name = "password_hash")
    private String passwordHash;
    
    @Column(name = "first_name")
    private String firstName;
    
    @Column(name = "last_name")
    private String lastName;
    
    @Column(name = "bio")
    private String bio;
    
    @OneToMany(cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "user")
    private Set<ReviewRequest> reviewRequests = new HashSet<>();
    
    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();
    
    public User() {
        
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public Set<ReviewRequest> getReviewRequests() {
        return reviewRequests;
    }

    public void setReviewRequests(Set<ReviewRequest> reviewRequests) {
        this.reviewRequests = reviewRequests;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    } 
    
}
