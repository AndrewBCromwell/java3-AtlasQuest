package com.atlasquest.DataObjects;

public class Attribute {
    private String attributeId;
    private String imgURL;

    public Attribute(String attributeId, String imgURL) {
        this.attributeId = attributeId;
        this.imgURL = imgURL;
    }

    public String getAttributeId() {
        return attributeId;
    }

    public void setAttributeId(String attributeId) {
        this.attributeId = attributeId;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }
}
