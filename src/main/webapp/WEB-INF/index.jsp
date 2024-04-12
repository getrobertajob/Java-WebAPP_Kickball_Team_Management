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
<title>Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<div class="container">
		<div class="topBox d-flex justify-content-center mt-4">
			<h1>Welcome!</h1>
		</div>

		<div class="text-danger d-flexjustify-content-center ">
			<c:out value="${notLoggedIn}"></c:out>
		</div>

		<div class="middleBox  border border-dark mt-4">
			<div class="d-flex justify-content-center border border-dark">
				<h2>Register</h2>
			</div>
			<div
				class="d-flex justify-content-center flex-column border border-dark">
				<form:form action="/register" method="post" modelAttribute="user">
					<div>
						<form:errors path="userName" class="text-danger"></form:errors>
					</div>
					<div>
						<form:errors path="email" class="text-danger"></form:errors>
					</div>
					<div>
						<form:errors path="password" class="text-danger"></form:errors>
					</div>
					<div>
						<form:errors path="confirmPassword" class="text-danger"></form:errors>
					</div>

					<div class="d-flex border border-dark">
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:label path="userName">User Name: </form:label>
						</div>
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:input path="userName" class="form-control"></form:input>
						</div>
					</div>

					<div class="d-flex border border-dark">
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:label path="email">Email: </form:label>
						</div>
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:input path="email" class="form-control"></form:input>
						</div>
					</div>

					<div class="d-flex border border-dark">
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:label path="password">Password: </form:label>
						</div>
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:input path="password" class="form-control"></form:input>
						</div>
					</div>

					<div class="d-flex border border-dark">
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:label path="confirmPassword">Confirm PW: </form:label>
						</div>
						<div class="w-50 p-2 flex-fill border border-dark">
							<form:input path="confirmPassword" class="form-control"></form:input>
						</div>
					</div>

					<div class="p-2 d-flex border border-dark">
						<button class="d-flex justify-content-center w-100 p-2">Register</button>
					</div>
				</form:form>
			</div>
		</div>
		<br />
		<div class="bottomBox border border-dark">
			<div class="d-flex justify-content-center border border-dark">
				<h2>Log In</h2>
			</div>
			<form:form action="/login" method="post" modelAttribute="loginUser">
				<div>
					<form:errors path="email" class="text-danger"></form:errors>
				</div>
				<div>
					<form:errors path="password" class="text-danger"></form:errors>
				</div>

				<div class="d-flex border border-dark">
					<div class="w-50 p-2 flex-fill border border-dark">
						<form:label path="email">Email: </form:label>
					</div>
					<div class="w-50 p-2 flex-fill border border-dark">
						<form:input path="email" class="form-control"></form:input>
					</div>
				</div>

				<div class="d-flex border border-dark">
					<div class="w-50 p-2 flex-fill border border-dark">
						<form:label path="password">Password: </form:label>
					</div>
					<div class="w-50 p-2 flex-fill border border-dark">
						<form:input path="password" class="form-control"></form:input>
					</div>
					<form:errors path="password" class="text-danger"></form:errors>
				</div>

				<div class="p-2 d-flex border border-dark">
					<button class="d-flex justify-content-center w-100 p-2">Log
						In</button>
				</div>
			</form:form>
		</div>

	</div>
</body>
</html>

