<%-- 
    Document   : about
    Created on : 3-Apr-2019, 11:28:39 AM
    Author     : tayor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
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
        
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8"  style="background-color: #d3d3d3;">
                    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #ffffff;">
                        <a class="navbar-brand" href="#">
                            <img src="./images/soccer.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
                            Brainz
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link" href="index">Home <span class="sr-only">(current)</span></a>
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
                                <li class="nav-item active">
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
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card" style="margin-bottom: 20px; margin-top: 10px;">
                                    <div class="card-header text-center">
                                        <b>About this Project</b>
                                    </div>
                                    <div class="card-body">
                                        <!--<h5 class="card-title">REST API</h5>-->
                                        <p class="card-text">
                                            This project is based on the MVC Architecture; basically having different components interact with one another.
                                        <p>This application is designed to demonstrate the ability of consuming data via an API. This project entirely remove the need for a data store and focuses on consuming data from a reliable source, in this case; An API.<p>
                                        <p>Two different APIs are consumed in this project; <b>Weather API</b>, to get the current weather based on this location and also the <b>Soccer API</b> to get live and archived soccer data</p>    
                                        <br>This project is divided into two distinct modules; <b>Web Service</b> and <b>Web Client</b></p>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Web Service</h5>
                                                <p class="card-text">The web service was developed in <b>Java</b> using <b>Spring Technologies</b>. It is divided into 3 major categories</p> 
                                                <ul>
                                                    <li>Controller</li>
                                                    <li>Service</li>
                                                    <li>Endpoint</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Web Client</h5>
                                                <p class="card-text">The web client was developed using <b>Javascript</b> and <b>Java</b>
                                                    Like the web service, it is also divided into 3 different layers</p>
                                                <ul>
                                                    <li>View/UI</li>
                                                    <li>Controller</li>
                                                    <li>Service / Processing</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="container" style="padding-top: 20px;">
                        <div class="row">
                            <div class="col-md-12" style="background-color: #e9ecef; ">
                                <p class="text-center" style="margin-bottom: 0;">All about soccer &copy; Brainz 2019</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
        </div>
    </body>
</html>
