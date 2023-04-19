<%
    String myName = (String)request.getAttribute("myName");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About AtlasQuest</title>
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
                <a href="">About</a>
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

    <main>
        <h1>About Letterboxing</h1>
        <p>
            Letterboxing combines artistic ability with “treasure-hunting” in parks and forests that the whole family can enjoy. Participants seek out hidden letterboxes by following clues to their prize: a rubber stamp—often hand-carved—to stamp into one’s own personal logbook.
        </p>
        <p>
            The basics are that simple, but you’ll find plenty of nuances to keep you busy on a rainy or snowy day (e.g. LTCs, postals or carving stamps and making logbooks for future use). Dig into some of the links below for more information. Note: The following links go to the website I was imitating. Only links in the nav bar and the "Clue" button go to pages I made.
        </p>
        <ul>
            <li>
                <p><a href="https://www.atlasquest.com/about/history/">History</a>: Letterboxing has a rich history crossing continents and centuries of time. Where did it begin? How has it evolved? This page has all the details.</p>
            </li>
            <li>
                <p><a href="https://www.atlasquest.com/about/getting-started/">Getting Started</a>: The materials you’ll need to get started with this hobby, and some helpful tips in finding and planting your first boxes.</p>
            </li>
            <li>
                <p><a href="https://www.atlasquest.com/about/wiki/faq.php">Frequently Asked Questions</a>: What is letterboxing? Who does it? Who runs Atlas Quest? Get answers to all these and more.</p>
            </li>
            <li>
                <p><a href="https://www.atlasquest.com/about/glossary/">Glossary</a>: Sometimes it can seem as if letterboxers are speaking a foreign language. This glossary contains some common (and not-so-common) terms one might hear letterboxers throwing around.</p>
            </li>
        </ul>
    </main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>