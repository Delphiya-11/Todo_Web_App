<title>Add Todo Page</title>
</head>
<body class="bg-dark">
	<%@ include file="common/header.jspf"%>
	<nav role="navigation"
		class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="">
			<a href="/" class="navbar-brand"><span
				class="glyphicon glyphicon-user"></span> ${username}</a>
		</div>
		<div class="navbar-collapse">
			<ul class="nav navbar-nav mr-auto nav-tabs">
				<li class="nav-item"><a href="/">Home</a></li>
				<li class="nav-item active"><a href="/list-todos">Todos</a></li>
			</ul>
			<ul class="nav justify-content-end">
				<li><a href="/logout">Logout <span
						class="glyphicon glyphicon-off"></span></a></li>
			</ul>
		</div>
	</nav>
	<br />
	<div class="container h-50 ">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-10 col-md-8 col-lg-6">
				<h3 style="color: white">Add todo for ${username}</h3>
				<br />
				<form:form method="post" modelAttribute="todo">
					<form:hidden path="id" />
					<fieldset class="form-group">
						<form:label path="description" style="color: white">Description</form:label>
						<form:input path="description" type="text"
							placeholder="Descripton of task" style="height:50px"
							class="form-control" required="required" />
						<form:errors path="description" cssClass="text-warning" />
					</fieldset>
					<fieldset class="form-group">
						<form:label path="targetDate" style="color: white">Target Date</form:label>
						<form:input path="targetDate" type="text" style="height:50px"
							class="form-control" required="required" />
						<form:errors path="targetDate" cssClass="text-warning" />
					</fieldset>
					<br />
					<input style="height: 50px" class="btn btn-primary w-100"
						type="submit" value="Submit" />
				</form:form>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jspf"%>
	<script
		src="webjars/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
	<script>
		$('#targetDate').datepicker({
			format : 'dd/mm/yyyy'
		});
	</script>
</body>
</html>
