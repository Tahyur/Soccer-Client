<%-- 
    Document   : Head2Head
    Created on : 28-Mar-2019, 6:17:43 PM
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                setInterval(getClock, 1000);
                function getClock() {
                    $('#clock').html(new Date().toLocaleTimeString());
                }
                
                $("#leagueId").change(function () {
                    $.ajax({
                        url: 'fetch',
                        data: {
                            id: $("#leagueId").val()
                        },
                        success: function (responseText) {
                            var output = '<option value="">Select Team</option>';
                            for (var i = 0; i < responseText.length; i++) {
                                output += "<option value='" + responseText[i].teamName + "'>" + responseText[i].teamName + "</option>";
                            }
                            $('.teamName').html(output);
                        }
                    });
                });

                $('#team1').change(function () {
                    $.ajax({
                        url: 'fetchTeamOneRecord',
                        data: {name: $('#team1').val()},
                        success: function (response) {
                            if (response !== null) {
                                getHeadToHead();
                                var teamName = $('#team1').val();
                                $('#teamOne').html(teamName)
                                var output = "";
                                var leagueForm = [];
                                $.each(response, function (i, item) {
                                    if (item.homeTeam === teamName) {
                                        output += "<tr><td class=text-size><b>" + item.homeTeam + "</b></td><td class=text-size>" + item.homeTeamScore + "</td><td class=text-size>" + item.awayTeamScore + "</td><td class=text-size>" + item.awayTeam + "</td>";
                                    } else {
                                        output += "<tr><td class=text-size>" + item.homeTeam + "</td><td class=text-size>" + item.homeTeamScore + "</td><td class=text-size>" + item.awayTeamScore + "</td><td class=text-size><b>" + item.awayTeam + "</b></td>";
                                    }
                                    leagueForm.push(item.gameStatus);
                                });
                                getLeagueFormA(leagueForm);
                                $('#homeTable').empty();
                                $('#homeTable').append(output);
                            } else {
                                $('#HtoHtable').append("");
                            }
                        },
                        error: function () {

                        }
                    });
                });

                $('#team2').change(function () {
                    $.ajax({
                        url: 'fetchTeamTwoRecord',
                        data: {
                            name: $('#team2').val()
                        },
                        success: function (response) {
                            if (response !== null) {
                                getHeadToHead();
                                var teamName = $('#team2').val();
                                $('#teamTwo').html(teamName);
                                var output = "";
                                var leagueForm = [];
                                $.each(response, function (i, item) {
                                    if (item.homeTeam === teamName) {
                                        output += "<tr><td class=text-size><b>" + item.homeTeam + "</b></td><td class=text-size>" + item.homeTeamScore + "</td><td class=text-size>" + item.awayTeamScore + "</td><td class=text-size>" + item.awayTeam + "</td>";
                                    } else {
                                        output += "<tr><td class=text-size>" + item.homeTeam + "</td><td class=text-size>" + item.homeTeamScore + "</td><td class=text-size>" + item.awayTeamScore + "</td><td class=text-size><b>" + item.awayTeam + "</b></td>";
                                    }
                                    leagueForm.push(item.gameStatus);
                                });
                                getLeagueFormB(leagueForm);
                                $('#awayTable').empty();
                                $('#awayTable').append(output);
                            } else {
                                $('#HtoHtable').append("");
                            }
                        }
                    });
                });

                function getHeadToHead() {
                    var teamOne = $('#team1').val();
                    var teamTwo = $('#team2').val();
                    console.log(teamOne);
                    console.log(teamTwo);
                    if ((teamOne) && (teamTwo)) {
                        $.ajax({
                            url: 'fetchHeadToHead',
                            data: {
                                teamOne: $('#team1').val(),
                                teamTwo: $('#team2').val()
                            },
                            success: function (response) {
                                console.log(response);
                                var output = "";
                                $.each(response, function (i, item) {
                                    output += "<tr><td class=text-size>" + item.homeTeam + "</td><td class=text-size>" + item.homeTeamScore + "</td><td class=text-size>" + item.awayTeamScore + "</td><td class=text-size>" + item.awayTeam + "</td>";

                                });
                                $('#HtoHtable').empty();
                                $('#HtoHtable').append(output);
                            }
                        });
                    }
                }

                function getLeagueFormA(leagueForm) {
                    var output = "";

                    $.each(leagueForm, function (i, item) {
                        if ((leagueForm[i] === 'W')) {
                            output += '<span class="badge badge-success">' + leagueForm[i] + '</span>'
                        } else if (leagueForm[i] === 'D') {
                            output += '<span class="badge badge-secondary">' + leagueForm[i] + '</span>'
                        } else {
                            output += '<span class="badge badge-danger">' + leagueForm[i] + '</span>'
                        }
                    });
                    $('#leagueFormA').empty();
                    $('#leagueFormA').append(output);
                }

                function getLeagueFormB(leagueForm) {
                    var output = "";

                    $.each(leagueForm, function (i, item) {
                        if ((leagueForm[i] === 'W')) {
                            output += '<span class="badge badge-success">' + leagueForm[i] + '</span>'
                        } else if (leagueForm[i] === 'D') {
                            output += '<span class="badge badge-secondary">' + leagueForm[i] + '</span>'
                        } else {
                            output += '<span class="badge badge-danger">' + leagueForm[i] + '</span>'
                        }
                    });
                    $('#leagueFormB').empty();
                    $('#leagueFormB').append(output);
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
                                <li class="nav-item">
                                    <a class="nav-item nav-link" href="standings">Standings<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-item nav-link" href="results">Results</a>
                                </li>
                                <li class="nav-item active">
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
                                <form:form method="Post" action="${pageContext.request.contextPath}/headtohead" modelAttribute="headtohead">
                                    <b><p class="text-center">Check the form teams in your preferred league and have a feel of how their season is unfolding</p></b>
                                    <table class="table table-borderless">
                                        <tr>
                                            <td class="align-middle">
                                                <div class="form-row align-items-center">
                                                    <div class="col-auto my-1">
                                                        <form:select path="leagueId" name="leagueId" class="custom-select mr-sm-2">
                                                            <form:option value="select league"></form:option>
                                                            <form:option value="63" selected="${selected}">English Championship</form:option>
                                                            <form:option value="128">Ligue 2</form:option>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </form:form>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <form:form method="Post" action="${pageContext.request.contextPath}/headtohead" modelAttribute="htoh">
                                    <table class="table table-borderless">
                                        <tr>
                                            <td class="align-left">
                                                <div class="form-row align-items-center"> 
                                                    <div class="col-auto my-1">
                                                        <form:select path="teamName" name="leagueId" class="teamName custom-select mr-sm-2" id="team1" >
                                                        </form:select>
                                                    </div>
                                                </div>          
                                            </td>
                                            <td>
                                                <div class="d-flex justify-content-end">
                                                    <div class="form-row align-items-center"> 
                                                        <div class="col-auto my-1">
                                                            <form:select path="teamName" name="leagueId" class="teamName custom-select mr-sm-2" id="team2" >
                                                            </form:select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </form:form> 
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">

                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p class="text-center" id="teamOne">Team 1</p>
                                            <div class="card border-light">
                                                <div class="card-body">
                                                    <table class="table table-borderless table-sm"  id="homeTable">                                    
                                                    </table>
                                                    <div id="leagueFormA"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p class="text-center">H2H</p>
                                            <div class="card  border-light">
                                                <div class="card-body">
                                                    <table class="table table-borderless table-sm"  id="HtoHtable">                                    
                                                    </table>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4">

                                <div class="container">
                                    <div class="row">

                                        <div class="col-md-12">
                                            <p class="text-center" id="teamTwo">Team 2</p>
                                            <div class="card  border-light">
                                                <div class="card-body">
                                                    <table class="table table-borderless table-sm"  id="awayTable">                                    
                                                    </table>
                                                    <div id="leagueFormB"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12" style="background-color: #e9ecef; margin-top: 10px; ">
                                <p class="text-center" style="margin-bottom: 0;">All about soccer &copy; Brainz 2019</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </body>
</html>
