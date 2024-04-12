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
<title>Edit Team</title>
</head>
<body>
	<div class="container mt-5 d-flex justify-content-start">
		<div class="">
			<h1 class="">Edit Team</h1>
			<p>
				<a href="/home">dashboard</a>
			</p>
		</div>
	</div>
	<div class="container">


		<div class="">
			<form:form action="/teams/${team.id}/edit" method="post"
				modelAttribute="team">
				<input type="hidden" name="_method" value="put">
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
							<form:label path="teamName" class="formLbl">Team Name: </form:label>
							<form:label path="skillLevel" class="formLbl">Skill Level (1-5): </form:label>
							<form:label path="gameDay" class="formLbl">Game Day: </form:label>
						</div>
						<div class="d-flex flex-column">
							<form:input path="teamName" class="formInput"></form:input>
							<form:input path="skillLevel" class="formInput"></form:input>
							<form:input path="gameDay" class="formInput"></form:input>
							<form:input path="user" class="formInput" type="hidden"
								value="${user_id}"></form:input>
							<div class="d-flex justify-content-end">
								<button class="btn btn-primary">Submit</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>

		<div class="d-flex flex-column mt-4">
			<a href="">delete</a>
		</div>
</body>
</html>