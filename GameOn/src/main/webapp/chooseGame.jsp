<%@ page import="it.unipi.dii.inginf.dsmt.gameon.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GameOn</title>
    <link href="resources/css/general.css" rel="stylesheet" type="text/css">
</head>
<body>
<button onclick = "window.location.href='./logout-servlet'">Logout</button>
    <h1 class="center-text">Welcome <%
        User myself = (User) session.getAttribute("loggedUser");
        out.println(myself.getUsername() + "!");
    %> </h1>
    <div style="width: 50%; margin: 0 auto">
        <div class="imgcontainer">
            <img src='resources/images/icon.png' alt="App Icon" width="75%">
        </div>
        <form action="chooseGame-servlet" method="post">
        <button class="mainButton" name="ticTacToeButton" value="ticTacToe">Tic-Tac-Toe</button>
        <button class="mainButton" name="connectFourButton" value="connectFour">Connect Four</button>
        </form>
    </div>
</body>
</html>
