package com.atlasquest.DataObjects;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User {
    private int id;
    private String trailName;
    private String firstName;
    private String lastName;
    private String email;
    private int boxesFound;
    private String status;
    private String privileges;

    public User(){
        id = -1;
        trailName = "Guest";
        firstName = "Guest";
        lastName = "Guest";
        email = "Guest";
        boxesFound = 0;
        status = "active";
        privileges = "none";
    }
    
    public User(int id, String trailName, String firstName, String lastName, String email, int boxesFound, String status, String privileges) {
        this.id = id;
        this.trailName = trailName;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.boxesFound = boxesFound;
        this.status = status;
        this.privileges = privileges;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTrailName() {
        return trailName;
    }

    public void setTrailName(String trailName) {
        if(trailName == null || trailName == ""){
            throw new IllegalArgumentException("Trail Name is required.");
        } else if (trailName.length() > 100) {
            throw new IllegalArgumentException("Trail Name can not be longer than 100 characters.");
        }
        this.trailName = trailName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        if(firstName == null || firstName == ""){
            throw new IllegalArgumentException("First Name is required.");
        } else if (firstName.length() > 100) {
            throw new IllegalArgumentException("First Name can not be longer than 100 characters.");
        }
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        if(lastName == null || lastName == ""){
            throw new IllegalArgumentException("Last Name is required.");
        } else if (lastName.length() > 100) {
            throw new IllegalArgumentException("Last Name can not be longer than 100 characters.");
        }
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        //Set the email pattern string
        Pattern p = Pattern.compile("(?:[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[A-Za-z0-9-]*[A-Za-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])");
        //Match the given string with the pattern
        Matcher m = p.matcher(email);
        //Check whether match is found
        if(!m.matches()) {
            throw new IllegalArgumentException("Invalid email address");
        }
        if(email.length() > 100) {
            throw new IllegalArgumentException("Email cannot have more than 100 characters");
        }
        this.email = email;
        this.email = email;
    }

    public int getBoxesFound() {
        return boxesFound;
    }

    public void setBoxesFound(int boxesFound) {
        this.boxesFound = boxesFound;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPrivileges() {
        return privileges;
    }

    public void setPrivileges(String privileges) {
        this.privileges = privileges;
    }
}
