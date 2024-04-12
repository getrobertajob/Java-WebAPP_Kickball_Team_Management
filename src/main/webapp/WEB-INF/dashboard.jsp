<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container  mt-4">
		<div class="leftBox">
			<h1>
				Welcome,
				<c:out value="${userName}"></c:out>
				!
			</h1>
		</div>
		<div class="rightBox">
			<p>
				<a href="/logout">logout</a>
			</p>
		</div>
	</div>

	<div class="container">
		<p>
			<c:out value="${error}" />
		</p>
		<table class="table table-striped border border-5 border-dark">
			<thead>
				<tr class="">
					<th
						class="border-end border-2 border-top-0 border-bottom-0 border-dark">Team
						Name</th>
					<th
						class="border-end border-2 border-top-0 border-bottom-0 border-dark">Skill
						Level (1-5)</th>
					<th
						class="border-end border-2 border-top-0 border-bottom-0 border-dark">Players</th>
					<th
						class="border-end border-2 border-top-0 border-bottom-0 border-dark">Game
						Day</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="oneTeam" items="${teams}">
					<tr class="tRow">
						<td
							class="border-end border-2 border-top-0 border-bottom-0 border-dark"><a
							href="/teams/${oneTeam.getId()}"><c:out
									value="${oneTeam.getTeamName()}"></c:out></a></td>
						<td
							class="border-end border-2 border-top-0 border-bottom-0 border-dark"><c:out
								value="${oneTeam.getSkillLevel()}"></c:out></td>
						<td
							class="border-end border-2 border-top-0 border-bottom-0 border-dark">
							<c:set var="userCount" value="${0}" /> <c:forEach var="oneUser"
								items="${oneTeam.player}">
								<c:set var="userCount" value="${userCount + 1}" />
							</c:forEach> <c:out value="${userCount}"></c:out>/9
						</td>
						<td
							class="border-end border-2 border-top-0 border-bottom-0 border-dark"><c:out
								value="${oneTeam.getGameDay()}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="container d-flex justify-content-center">
		<form action="/teams/new" class="">
			<input type="submit" value="Create New Team" />
		</form>
	</div>

</body>
</html>

