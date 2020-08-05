<title>Welcome Page</title>
</head>
<body>
	<%@ include file="common/header.jspf"%>
	<nav role="navigation" class="navbar navbar-default">
		<div class="">
			<a href="/" class="navbar-brand">${name}</a>
		</div>
		<div class="navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">Home</a></li>
				<li><a href="/list-todos">Todos</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/logout">Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<br />
		<h1>Welcome ${name}</h1>
		<br />
		<h2>
			<a href="/list-todos">Click here</a> to manage your todos.
		</h2>
	</div>
	<%@ include file="common/footer.jspf"%>
</body>
</html>