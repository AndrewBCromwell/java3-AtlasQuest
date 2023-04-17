package com.atlasquest.DataObjects;

import java.util.Date;
import java.util.List;

public class Letterbox {
    private int id;
    private String name;
    private String location;
    private String owner;
    private String findability;
    private List<Attribute> attributes;
    private String status;
    private Date planted;
    private Date lastFound;
    private String clue;

    public Letterbox(int id, String name, String location, String owner, String findability, List<Attribute> attributes, String status, Date planted, Date lastFound, String clue) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.owner = owner;
        this.findability = findability;
        this.attributes = attributes;
        this.status = status;
        this.planted = planted;
        this.lastFound = lastFound;
        this.clue = clue;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getFindability() {
        return findability;
    }

    public void setFindability(String findability) {
        this.findability = findability;
    }

    public List<Attribute> getAttributes() {
        return attributes;
    }

    public void setAttributes(List<Attribute> attributes) {
        this.attributes = attributes;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getPlanted() {
        return planted;
    }

    public void setPlanted(Date planted) {
        this.planted = planted;
    }

    public Date getLastFound() {
        return lastFound;
    }

    public void setLastFound(Date lastFound) {
        this.lastFound = lastFound;
    }

    public String getClue() {
        return clue;
    }

    public void setClue(String clue) {
        this.clue = clue;
    }
}