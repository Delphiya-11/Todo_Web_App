<title>Welcome Page</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body class="bg-dark text-white">
	<%@ include file="common/header.jspf"%>
	<nav role="navigation"
		class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="">
			<a href="/" class="navbar-brand"><span
				class="glyphicon glyphicon-user"></span> ${username}</a>
		</div>
		<div class="navbar-collapse">
			<ul class="nav navbar-nav mr-auto nav-tabs">
				<li class="nav-item active"><a href="/">Home</a></li>
				<li class="nav-item"><a href="/list-todos">Todos</a></li>
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
				<br />
				<h1>Welcome ${username}</h1>
				<br />
				<h2>
					<a href="/list-todos">Click here</a> to manage your todos.
				</h2>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jspf"%>
</body>
</html>