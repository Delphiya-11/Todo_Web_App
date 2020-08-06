<title>Error Page</title>
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
				<li class="nav-item"><a href="/">Home</a></li>
				<li class="nav-item"><a href="/list-todos">Todos</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">Other Details</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/left-todos">Todos Left</a>
						<a class="dropdown-item" href="/done-todos">Todos Done</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Settings</a>
					</div>
				</li>
			</ul>
			<ul class="nav justify-content-end">
				<li><a href="/logout">Logout <span
						class="glyphicon glyphicon-off"></span></a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<h2>An exception occurred. Please contact Support!</h2>
	</div>
	<%@ include file="common/footer.jspf"%>
</body>
</html>