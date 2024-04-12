<%@ page isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Team Details</title>
</head>
<body>
	<div class="container">
		<div class="container mt-5">
			<h1 class="">${team.teamName}</h1>
			<p>
				<a href="/home">dashboard</a>
			</p>
		</div>
		<div class="teamInfo">
			<div>
				Team Name:
				<c:out value="${team.teamName}"></c:out>
			</div>
			<div>
				Added By:
				<c:out value="${team.user.userName}"></c:out>
			</div>
			<div>
				Skill Level:
				<c:out value="${team.skillLevel}"></c:out>
			</div>
			<div>
				Game Day:
				<c:out value="${team.gameDay}"></c:out>
			</div>
		</div>
		<div class="mt-5">
			Players
			<c:set var="playerCount" value="${0}" />
			<ul>
				<c:forEach var="onePlayer" items="${team.player}">
					<li><c:out value="${onePlayer.getPlayerName()}"></c:out></li>
					<c:set var="playerCount" value="${playerCount + 1}" />
				</c:forEach>
			</ul>
		</div>

		<div class="container mt-5 border-top border-dark">
			<c:if test="${playerCount >= 9}">
				<div class="d-flex flex-column mt-4">The team is full !</div>
			</c:if>
			<div class="mt-5">Add Player</div>
			<div class="border border-dark">
				<form:form action="/teams/${team.id}/addPlayer" method="post"
					modelAttribute="player">
					<div class="formErr">
						<p>
							<form:errors path="playerName" class="formErr">First Name cannot be left blank</form:errors>
						</p>
					</div>

					<div class="d-flex border border-dark">
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:label path="playerName">Player Name: </form:label>
						</div>
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:input path="playerName" class="form-control"></form:input>
						</div>
					</div>
					<div class="p-2 d-flex border border-dark">
						<c:if test="${playerCount >= 9}">
							<div class="d-flex flex-column mt-4">
								<button class="d-flex justify-content-center w-100 p-2" disabled>Add</button>
							</div>
						</c:if>
						<c:if test="${playerCount < 9}">
							<div class="d-flex flex-column mt-4">
								<button class="d-flex justify-content-center w-100 p-2">Add</button>
							</div>
						</c:if>
					</div>
					<form:input path="team" class="formInput" value="${team_id}"
						type="hidden"></form:input>
				</form:form>
			</div>
		</div>

		<c:if test="${team.user.id == user.id}">
			<div class="d-flex flex-column mt-4">
				<a href="/teams/${team.id}/edit">Edit</a> <a
					href="">delete</a>
			</div>
		</c:if>
</body>
</html>