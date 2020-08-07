<title>Login Page</title>
</head>
<body class="text-white">
	<%@ include file="common/header.jspf"%>
	<div
		style="background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://images.unsplash.com/photo-1503551723145-6c040742065b?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1050&amp;q=80); background-repeat: no-repeat; background-size: cover">
		<div class="container h-100 ">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="card card-transparent shadow-lg rounded"
					style="background-color: rgba(245, 245, 245, 0.4); height: 450px; width: 400px">
					<div
						class="card-body row h-100 justify-content-center align-items-center">
						<h3 class="card-title">Login to your account</h3>
						<br /> <br /> <font color="red">${errorMessage}</font>
						<form:form action="/login" method="post" modelAttribute="user">
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
					<div align="center" class="card-footer" style="font-size: 18px">
						New to Todo WebApp?
						<button style="font-size: 18px" type="button"
							class="btn btn-outline-warning" data-toggle="modal"
							data-target="#exampleModalCenter">Sign Up</button>

						<!-- Modal -->
						<div style="color: black" class="modal fade"
							id="exampleModalCenter" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title" id="exampleModalLongTitle">Create
											An Account</h3>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div
											class="row d-flex justify-content-center align-items-center">
											<form:form action="/register" method="post"
												modelAttribute="user">
												<fieldset class="form-group">
													<form:label class="col-md-6" path="firstname">First Name</form:label>
													<form:input path="firstname" type="text"
														placeholder="Enter first name"
														style="height:45px; width:350px" class="form-control"
														required="required" />
												</fieldset>
												<fieldset class="form-group">
													<form:label class="col-md-6" path="lastname">Last Name</form:label>
													<form:input path="lastname" type="text"
														placeholder="Enter last name"
														style="height:45px; width:350px" class="form-control"
														required="required" />
												</fieldset>
												<fieldset class="form-group">
													<form:label class="col-md-6" path="username">Username</form:label>
													<form:input path="username" type="text"
														placeholder="Enter username"
														style="height:45px; width:350px" class="form-control"
														required="required" />
													<form:errors path="username" cssClass="text-warning" />
												</fieldset>
												<fieldset class="form-group">
													<form:label class="col-md-6" path="password">Password</form:label>
													<form:input path="password" type="password"
														placeholder="Enter password"
														style="height:45px; width:350px" class="form-control"
														required="required" />
													<form:errors path="password" cssClass="text-warning" />
												</fieldset>
												<br />
												<input style="height: 40px; width: 350px"
													class="btn btn-success" type="submit" value="Register" />
											</form:form>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jspf"%>
</body>
</html>
