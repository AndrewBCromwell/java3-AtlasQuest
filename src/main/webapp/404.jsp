<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Page not found</title>
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
    <h1 class="oops">Oops. The url you requested does not seem to be available.</h1>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>