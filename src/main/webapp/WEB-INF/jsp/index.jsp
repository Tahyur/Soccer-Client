<%-- 
    Document   : index
    Created on : 23-Mar-2019, 10:38:02 PM
    Author     : tayor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Soccer</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                setInterval(getClock, 1000);
                function getClock() {
                    $('#clock').html(new Date().toLocaleTimeString());
                }
            });

        </script>
    </head>
    <body>
        <c:set var = "now" value = "<%= java.util.Calendar.getInstance().getTime()%>" />
        <!--<div class="view" style="background-image: url('./images/backgroundImage.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">-->
            <div class="container">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8" style="background-color: #d3d3d3;">
                        <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #ffffff;">
                            <a class="navbar-brand" href="#">
                                <img src="./images/soccer.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
                                Brainz
                            </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-item nav-link" href="standings">Standings</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-item nav-link" href="results">Results</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-item nav-link" href="headtohead">H2H</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-item nav-link" href="about">About</a>
                                    </li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <div>
                                        <span><fmt:formatDate pattern = "MMM dd, yyyy" value = "${now}" /></span><br><span id="clock"></span><br>
                                        <span>${weather.getAverageTemperature()}&deg;C</span>
                                    </div>
                                </ul>
                            </div>
                        </nav>
                        <div class="jumbotron jumbotron-fluid">
                            <div class="container">
                                <h1 class="display-4">All about Soccer</h1>
                                <p class="lead">A Web Client to view England's championship and French ligue 2 scores,team and league standings realtime</p>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card" style="width: 18rem;">
                                        <div class="card-body">
                                            <h5 class="card-title">Standings</h5>
                                            <h6 class="card-subtitle mb-2 text-muted">Championship/Ligue 2</h6>
                                            <p class="card-text">Get current standings from England's second most exciting league; Championship and France second tier league</p>
                                            <a href="standings" class="card-link">Standings</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card" style="width: 18rem;">
                                        <div class="card-body">
                                            <h5 class="card-title">Results</h5>
                                            <h6 class="card-subtitle mb-2 text-muted">Scores</h6>
                                            <p class="card-text">Get a quick overview of games recently played and stay up to date with the latest results and keep track of your favorite team </p>
                                            <a href="results" class="card-link">Results</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
            <div class="container" style="padding-top: 10px;">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8" style="background-color: #e9ecef; ">
                        <p class="text-center" style="margin-bottom: 0;">All about soccer &copy; Brainz 2019</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </div>    
    </body>
</html>
