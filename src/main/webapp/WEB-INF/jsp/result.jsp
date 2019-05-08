<%-- 
    Document   : competitions
    Created on : 24-Mar-2019, 12:32:16 AM
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
        <title>Competitions</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">  
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                setInterval(getClock, 1000);
                function getClock() {
                    $('#clock').html(new Date().toLocaleTimeString());
                }

                $(function () {
                    $("#from").datepicker({
                        dateFormat: 'yy-mm-dd',
                        showAnim: 'fade'
                    });
                    $("#to").datepicker({
                        dateFormat: 'yy-mm-dd',
                        showAnim: 'fade'
                    });
                });

            });
        </script>
    </head>
     <body>
        <c:set var = "now" value = "<%= java.util.Calendar.getInstance().getTime()%>" />
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8" style="background-color: #d3d3d3;">
                    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #ffffff;">
                        <a class="navbar-brand" href="#">
                            <img src="./images/soccer.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
                            Brainz
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                                <li class="nav-item ">
                                    <a class="nav-link" href="index">Home </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-item nav-link" href="standings">Standings</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-item nav-link" href="#">Results <span class="sr-only">(current)</span></a>
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
                            <div class="col-md-12">
                                <form:form method="Post" action="${pageContext.request.contextPath}/results" modelAttribute="matches">
                                    <b><p class="text-center">View league results for a specified date range</p></b>
                                    <div class="text-center"> <span class="badge badge-danger text-center">${error}</span></div>
                                    <table class="table table-borderless">
                                        <tr>
                                            <th scope="col" class="text-center">League</th>
                                            <th scope="col" class="text-center">From</th>
                                            <th scope="col" class="text-center">To</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <form:select path="leagueId" name="leagueId" class="custom-select mr-sm-2" >
                                                    <form:option value="">Select league</form:option>
                                                    <form:option value="63">English Championship</form:option>
                                                    <form:option value="128">Ligue 2</form:option>
                                                </form:select>
                                            </td>
                                            <td><form:input  path="from" class="form-control mb-2 mr-sm-1" readonly='readonly'></form:input></td>
                                            <td><form:input path="to" class="form-control mb-2 mr-sm-1" readonly='readonly'></form:input></td>
                                            <td><form:button value="save" class="btn btn-light">Search</form:button></td>
                                            </tr>
                                        </table>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10">
                                <c:choose>
                                    <c:when test="${match.size() > 0}">
                                        <c:forEach items="${match}" var="mch">

                                            <div class="card w-100 text-center margin-bottom-10 bg-light">
                                                <div class="card-body d-flex justify-content-center ">
                                                    <table class="table table-borderless">
                                                        <tr>
                                                            <td></td>
                                                            <td class="text-center" style="padding: 0;"> <c:out value="${mch.getMatchTime()}" /></td>
                                                            <td class="text-right" style="padding: 0;"> <c:out value="${mch.getMatchDate()}" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-left w-25 align-middle" style="padding: 0;"><div class="card-text "> <c:out value="${mch.getHomeTeam()}" /></div>
                                                                <table>
                                                                    <c:forEach items="${mch.getGoalScorers()}" var="goal">
                                                                        <c:choose>
                                                                            <c:when test="${!(goal.getHomeScorer().isEmpty()) && mch.getHomeTeamScore() != 0}">
                                                                                <tr>
                                                                                    <td class="text-center text-size" style="padding: 0; float: left;"><c:out value="${goal.getHomeScorer()} (${goal.getTime()})" /></td>
                                                                                </tr>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </table>
                                                            </td>
                                                            <td class="text-center w-25">
                                                                <div class="d-flex justify-content-center">
                                                                    <table>
                                                                        <tr>
                                                                            <td colspan="3" class="padding-none"><c:out value="${mch.getMatchStatus()}" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><div class="card-text "> <c:out value="${mch.getHomeTeamScore()}" /></div></td>
                                                                            <td><div class="card-text "> <c:out value="-" /></div></td>
                                                                            <td><div class="card-text "> <c:out value="${mch.getAwayTeamScore()}" /></div></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="3" class="padding-none"><c:out value="(HT ${mch.getHomeHalfTimeScore()} - ${mch.getAwayHalfTimeScore()})" /></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                            <td class="text-right w-25 align-middle" style="padding: 0;"><div class="card-text"> <c:out value="${mch.getAwayTeam()}" /></div>
                                                                <div class="d-flex justify-content-end">
                                                                    <table>
                                                                        <c:forEach items="${mch.getGoalScorers()}" var="goal">
                                                                            <c:choose>
                                                                                <c:when test="${!(goal.getAwayScorer().isEmpty()) && mch.getAwayTeamScore() != 0}">
                                                                                    <tr>
                                                                                        <td class="text-center text-size" style="padding: 0; float: right;"><c:out value="${goal.getAwayScorer()} (${goal.getTime()})" /></td>
                                                                                    </tr>
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12" style="background-color: #e9ecef; ">
                                    <p class="text-center" style="margin-bottom: 0">All about soccer &copy; Brainz 2019</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
