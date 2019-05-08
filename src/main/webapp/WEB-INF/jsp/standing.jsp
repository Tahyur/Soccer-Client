<%-- 
    Document   : standings
    Created on : 24-Mar-2019, 12:31:47 AM
    Author     : tayor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                                    <a class="nav-link" href="index">Home </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-item nav-link" href="#">Standings<span class="sr-only">(current)</span></a>
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
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-12">
                                <b><p class="text-center">Check the current league table, just choose your preferred league</p></b>
                                <div class="row">
                                    <div class="col-md-5">
                                        <form:form method="Post" action="${pageContext.request.contextPath}/standings" modelAttribute="standings">

                                            <div class="text-center"> <span class="badge badge-danger text-center">${error}</span></div>
                                            <table class="table table-borderless">
                                                <tr>
                                                    <td class="align-middle">
                                                        <form:select path="leagueId" name="leagueId" class="custom-select mr-sm-2">
                                                            <form:option value="">Select league</form:option>
                                                            <form:option value="63">English Championship</form:option>
                                                            <form:option value="128">Ligue 2</form:option>
                                                        </form:select>
                                                    </td>
                                                    <td><form:button value="save" class="btn btn-light">Process</form:button></td>
                                                    </tr>
                                                </table>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        </div>  
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <c:choose>
                                    <c:when test="${standing.getStandings().size() > 0}">
                                        <div class="table-responsive">
                                            <table class="table table-dark table-hover">
                                                <caption style="color: white;">${standing.getStandings().get(0).getLeagueName()} League table <br>
                                                    ${standing.getStandings().get(0).getCountryName()}</caption>
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th scope="col">Pos</th>
                                                        <th scope="col">Team</th>
                                                        <th scope="col">Played</th>
                                                        <th scope="col">Won</th>
                                                        <th scope="col">Draw</th>
                                                        <th scope="col">Loss</th>
                                                        <th scope="col">GF</th>
                                                        <th scope="col">GA</th>
                                                        <th scope="col">GD</th>
                                                        <th scope="col">Points</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${standing.getStandings()}" var="team">
                                                        <tr>
                                                            <td style="font-size: 14px;"><c:out value="${team.getLeaguePosition()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getTeamName()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getGamesPlayed()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getGamesWon()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getGamesDrawn()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getGamesLost()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getGoalsFor()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getGoalsAgainst()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getGoalDifference()}"/></td>
                                                            <td style="font-size: 14px;"><c:out value="${team.getTotalPoints()}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8" style="background-color: #e9ecef; ">
                        <p class="text-center" style="margin-bottom: 0">All about soccer &copy; Brainz 2019</p>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>

        </div>
    </body>
</html>
