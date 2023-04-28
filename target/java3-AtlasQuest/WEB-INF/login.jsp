<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean loginFailed = (Boolean)request.getAttribute("loginFailed");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AQ Login</title>
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
            <a href="login">Login</a>
        </li>
    </ul>
</nav>
<!-- end or shared section -->
<main class="form-signin w-100 mx-auto">

    <form method="POST" action="login">
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

        <div class="form-floating">
            <input type="text" class="form-control" name="trailName" id="floatingInput">
            <label for="floatingInput">Trail Name</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>

        <% if(loginFailed) { %>
        <div class="alert alert-warning" role="alert">
            That trail name and password combination could not be found
        </div>
        <% } %>

    </form>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>