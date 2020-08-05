<title>Todos for ${name}</title>
</head>
<body class="p-3 mb-2 bg-dark text-white">
	<%@ include file="common/header.jspf"%>
	<nav role="navigation"
		class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="">
			<a href="/" class="navbar-brand"><span
				class="glyphicon glyphicon-user"></span> ${name}</a>
		</div>
		<div class="navbar-collapse">
			<ul class="nav navbar-nav mr-auto nav-tabs">
				<li class="nav-item"><a href="/">Home</a></li>
				<li class="nav-item"><a href="/list-todos">Todos</a></li>
				<li class="nav-item dropdown active"><a
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
				<li><a href="/logout">Logout <span
						class="glyphicon glyphicon-off"></span></a></li>
			</ul>
		</div>
	</nav>
	<br />
	<div class="container">
		<h2>Here's a list of ${name}'s left todos:</h2>
		<br /> <br />
		<table class="table table-striped table-dark">
			<caption>Your Left Todos</caption>
			<thead class="thead-dark">
				<tr>
					<th>Description</th>
					<th>Date</th>
					<th>Is Done?</th>
					<th>Mark As Done</th>
					<th>Delete Todo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${todos}" var="todo">
					<tr>
						<td>${todo.description}</td>
						<td><fmt:formatDate value="${todo.targetDate}"
								pattern="dd/MM/yyyy" /></td>
						<td>${todo.done}</td>
						<td><a
							style="font-size: 20px; color: yellow; text-shadow: 2px 2px 4px #000000;"
							href="/todo-done?id=${todo.id}"><span
								class="glyphicon glyphicon-check"></span></a></td>
						<td><a
							style="font-size: 20px; color: red; text-shadow: 2px 2px 4px #000000;"
							href="/delete-todo?id=${todo.id}"><span
								class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file="common/footer.jspf"%>
</body>
</html>