<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.atlasquest.DataObjects.Letterbox" %>
<%@ page import="com.atlasquest.DataObjects.Attribute" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.atlasquest.DataObjects.User" %>
<%
    ArrayList<Letterbox> letterboxes = (ArrayList<Letterbox>)request.getAttribute("Letterboxes");
    String error = (String)request.getAttribute("Error");
    String search = (String)request.getAttribute("search");
    if(search == null){
        search = "";
    }
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
            <a href="register">Register</a>
        </li>
        <li>
            <a href="login"><%=session.getAttribute("user") == null ? "Login" : "Logout"%></a>
        </li>
    </ul>
</nav>
<!-- end or shared section -->


<main>
    <h1>Letterboxes</h1>
    <div class="search">
        <%
            User user = (User)session.getAttribute("user");
            if(user == null){ user = new User();}
            if(user.getPrivileges().equals("premium")){
        %>
            <form class="d-flex" role="search" method="post" action="letterboxes">
                <input class="form-control me-2" type="search" aria-label="Search" name="q" value="<%=search%>">
                <button class="btn btn-success" type="submit">Search</button>
            </form>
        <% } else { %>
            <p>You must be Premium to use the search box</p>
        <% } %>
    </div>
    <% for(Letterbox letterbox : letterboxes) { %>
        <div class="row <%=index % 2 == 0 ? "even" : "odd"%>">
            <div class="col-1">
                <p><%=index%>.</p>
            </div>
            <div class="col-sm-11 col-md-5 col-lg-3 col-xl-2">
                <h4><%=letterbox.getName()%></h4>
                <p><%=letterbox.getLocation()%></p>
                <p>Owner:  <%=letterbox.getOwner()%></p>
                <p>Findability:  <%=letterbox.getFindability()%></p>
            </div>
            <div class="col-sm-11 col-md-5 col-lg-3 col-xl-2">
                <% for(Attribute attribute : letterbox.getAttributes()) { %>
                    <img src="<%=attribute.getImgURL()%>" alt="<%=attribute.getAttributeId()%>">
                <% } %>
            </div>
            <div class="col-sm-11 col-md-5 col-lg-3 col-xl-2">
                <p>Status:<%=letterbox.getStatus()%></p>
                <p>Planted:</p>
                <p><%=letterbox.getPlanted()%></p>
                <p>Last Found:</p>
                <p><%=letterbox.getLastFound()%></p>
            </div>
            <div class="col-2">
                <a href="letterboxclue?id=<%=letterbox.getId()%>"><button>Clue</button></a>
                <br>
                <br>
                <a href="find?box=<%=letterbox.getId()%>"><button>Record find</button></a>
            </div>
        </div>
        <% index++; %>
    <% } %>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>