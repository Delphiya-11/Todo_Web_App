<title>Profile Page</title>
<link href="css/style.css" rel="stylesheet">
<script>
	history.forward();
</script>
<style>
body {
	background-color: white;
	color: black;
}

.dark-mode {
	background-color: #373737;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="common/header.jspf"%>
	<nav role="navigation"
		class="navbar navbar-expand navbar-light bg-light">
		<div class="">
			<a href="/" class="navbar-brand"><span
				class="glyphicon glyphicon-user"></span> ${username}</a>
		</div>
		<div class="navbar-collapse">
			<ul class="nav navbar-nav mr-auto nav-tabs">
				<li class="nav-item active"><a href="/">Profile</a></li>
				<li class="nav-item"><a href="/list-todos">Todos</a></li>
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
	<div class="container h-50">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-10 col-md-8 col-lg-6">
				<div class="card card-transparent shadow-lg"
					style="background-color: rgba(245, 245, 245, 0.4); height: 320px; width: 400px">
					<div class="card-body">
						<h2 class="card-title">User Profile</h2>
					</div>
					<ul class="list-group list-group-flush"
						style="font-size: 24px; color: black;">
						<li class="list-group-item">First Name: ${firstname}</li>
						<li class="list-group-item">Last Name: ${lastname}</li>
						<li class="list-group-item">Username: ${username}</li>
					</ul>
					<div class="card-body" style="font-size: 18px">
						<a href="/list-todos" class="card-link">Click here</a> to manage
						your todos.
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function myFunction() {
			var element = document.body;
			element.classList.toggle("dark-mode");
		}
	</script>
	<%@ include file="common/footer.jspf"%>
</body>
</html>