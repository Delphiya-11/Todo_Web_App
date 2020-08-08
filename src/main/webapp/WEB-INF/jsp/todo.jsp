<title>Add Todo Page</title>
<link href="css/style.css" rel="stylesheet">
<style>
body {
	background-color: white;
	color: black;
}

.dark-mode {
	background-color: #373737;
	color: white;
}

.datepicker td.active, .datepicker td.active:hover {
	color: #ffffff;
	background-color: #006dcc;
	background-image: linear-gradient(to bottom, #0088cc, #0044cc);
}
</style>
</head>
<body>
	<%@ include file="common/header.jspf"%>
	<nav role="navigation"
		class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="">
			<a href="/" class="navbar-brand"><span
				class="glyphicon glyphicon-user"></span> ${username}</a>
		</div>
		<div class="navbar-collapse">
			<ul class="nav navbar-nav mr-auto nav-tabs">
				<li class="nav-item"><a href="/">Profile</a></li>
				<li class="nav-item active"><a href="/list-todos">Todos</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Other
						Details</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/left-todos">Todos Left</a> <a
							class="dropdown-item" href="/done-todos">Todos Done</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Settings</a>
					</div></li>
			</ul>
			<ul class="nav justify-content-end">
				<li>
					<div class="theme-switch-wrapper">
						<label class="theme-switch" for="checkbox"> <input
							type="checkbox" id="checkbox" onclick="myFunction()" />
							<div class="slider round"></div>
						</label> &nbsp;&nbsp; <label style="color: black">Go Dark!</label>
						&nbsp;&nbsp;
					</div>
				</li>
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
				<h3>Add todo for ${username}</h3>
				<br />
				<form:form method="post" modelAttribute="todo">
					<form:hidden path="id" />
					<fieldset class="form-group">
						<form:label path="description">Description</form:label>
						<form:input path="description" type="text"
							placeholder="Descripton of task" style="height:50px"
							class="form-control" required="required" />
						<form:errors path="description" cssClass="text-warning" />
					</fieldset>
					<fieldset class="form-group">
						<form:label path="targetDate">Target Date</form:label>
						<form:input path="targetDate" type="text" style="height: 50px"
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
			format : 'dd/mm/yyyy',
			autoclose : true
		});

		function myFunction() {
			var element = document.body;
			element.classList.toggle("dark-mode");
		}
	</script>
</body>
</html>
