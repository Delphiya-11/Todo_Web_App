<title>Login Page</title>
</head>
<body class="text-white">
	<%@ include file="common/header.jspf"%>
	<div
		style="background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://images.unsplash.com/photo-1503551723145-6c040742065b?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1050&amp;q=80); background-repeat: no-repeat; background-size: cover">
		<div class="container h-100 ">
			<div class="row h-100 justify-content-center align-items-center">
				<div
					class="card-transparent rounded shadow-lg rounded align-items-center"
					style="background-color: rgba(245, 245, 245, 0.4); height: 400px; width: 400px">
					<div
						class="card-body row h-100 justify-content-center align-items-center">
						<h3 class="card-title">Login to your account</h3>
						<br /> <br /> <font color="red">${errorMessage}</font>
						<form:form method="post" modelAttribute="user">
							<fieldset class="form-group">
								<form:label path="username">Username</form:label>
								<form:input path="username" type="text"
									placeholder="Enter username" style="height:45px; width:350px"
									class="form-control" required="required" />
							</fieldset>
							<fieldset class="form-group">
								<form:label path="password">Password</form:label>
								<form:input path="password" type="password"
									placeholder="Enter password" style="height:45px; width:350px"
									class="form-control" required="required" />
							</fieldset>
							<br />
							<input style="height: 40px; width: 350px" class="btn btn-info"
								type="submit" value="Login" />
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jspf"%>
</body>
</html>
