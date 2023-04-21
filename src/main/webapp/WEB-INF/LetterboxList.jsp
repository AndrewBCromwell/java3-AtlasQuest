<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.atlasquest.DataObjects.Letterbox" %>
<%@ page import="com.atlasquest.DataObjects.Attribute" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Letterbox> letterboxes = (ArrayList<Letterbox>)request.getAttribute("Letterboxes");
    String error = (String)request.getAttribute("Error");
    int index = 1;
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Letterboxes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/shared.css">
</head>
<body>
<!-- this will be in every jsp file -->
<header class="text-center">
    <img src="https://www.atlasquest.com/css/images/logo/48.png" alt="Atlas Quest">
</header>
<nav>
    <ul>
        <li>
            <a href="about">About</a>
        </li>
        <li>
            <a href="letterboxes">Letterboxes</a>
        </li>
        <li>
            <a href="premium">Become Premium</a>
        </li>
        <li>
            <a href="register">register</a>
        </li>
        <li>
            <a href="login">Login</a>
        </li>
    </ul>
</nav>
<!-- end or shared section -->

<h1>Letterboxes</h1>
<div class="container mx-4">
    <% for(Letterbox letterbox : letterboxes) { %>
        <div class="row <%=index % 2 == 0 ? "even" : "odd"%>">
            <div class="col-1">
                <p><%=index%>.</p>
            </div>
            <div class="col-sm-11 col-md-5 col-lg-3 col-xl-2 p-0">
                <h4><%=letterbox.getName()%></h4>
                <p><%=letterbox.getLocation()%></p>
                <p>Owner:  <%=letterbox.getOwner()%></p>
                <p>Findability:  <%=letterbox.getFindability()%></p>
            </div>
            <div class="col-sm-11 col-md-5 col-lg-3 col-xl-2 p-0">
                <% for(Attribute attribute : letterbox.getAttributes()) { %>
                    <img src="<%=attribute.getImgURL()%>" alt="<%=attribute.getAttributeId()%>">
                <% } %>
            </div>
            <div class="col-sm-11 col-md-5 col-lg-3 col-xl-2 p-0">
                <p>Status:<%=letterbox.getStatus()%></p>
                <p>Planted:</p>
                <p><%=letterbox.getPlanted()%></p>
                <p>Last Found:</p>
                <p><%=letterbox.getLastFound()%></p>
            </div>
            <div class="col-sm-11 col-md-5 col-lg-3 col-xl-2 p-0">
                <button class="btn">Clue</button>
            </div>
        </div>
        <% index++; %>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>