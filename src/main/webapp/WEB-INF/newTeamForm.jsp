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
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Create New Team</title>
</head>
<body>
	<div class="container mt-5 d-flex justify-content-start">
		<div class="">
			<h1 class="">New Team</h1>
			<p>
				<a href="/home">dashboard</a>
			</p>
		</div>
	</div>

	<div class="container">
		<form:form action="/teams/new" method="post" modelAttribute="team">

			<div class="">
				<div class="d-flex justify-content-center">
					<div class="d-flex flex-column text-danger">
						<div class="formErr">
							<p>
								<form:errors path="teamName" class="formErr"></form:errors>
							</p>
							<p>
								<form:errors path="skillLevel" class="formErr"></form:errors>
							</p>
							<p>
								<form:errors path="gameDay" class="formErr"></form:errors>
							</p>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="d-flex flex-column mr-3">
						<br />
						<form:label path="teamName" class="formLbl">Team Name    </form:label>
						<form:label path="skillLevel" class="formLbl">Skill Level (1-5)    </form:label>
						<form:label path="gameDay" class="formLbl">Game Day:    </form:label>
					</div>
					<div class="d-flex flex-column">
						<form:input path="teamName" class="formInput"></form:input>
						<form:input path="skillLevel" class="formInput" type="number"></form:input>
						<form:input path="gameDay" class="formInput"></form:input>
						<form:input path="user" class="formInput" value="${user_id}"
							type="hidden"></form:input>
						<div class="d-flex justify-content-end">
							<button class="btn btn-primary">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>

</body>
</html>