<title>Todos for ${username}</title>
<link href="css/style.css" rel="stylesheet">
<style>
body {
	background-color: white;
	color: black;
}

.dark-mode {
	background-color: #1c313a;
	color: white;
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
				<li class="nav-item"><a href="/">Home</a></li>
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
						</label> <em>Enable Dark Mode!</em>
					</div>
				</li>
			</ul>
			<ul class="nav justify-content-end">
				<li><a href="/login">Logout <span
						class="glyphicon glyphicon-off"></span></a></li>
			</ul>
		</div>
	</nav>
	<br />
	<div class="container">
		<div class="card-transparent rounded shadow-lg p-3 mb-5 rounded"
			style="background-color: rgba(245, 245, 245, 0.4);">
			<div class="card-body">
				<h2>Here's a list of ${username}'s todos:</h2>
				<br />
				<table class="table table-striped table-dark">
					<caption>Your Todos</caption>
					<thead>
						<tr>
							<th>Description</th>
							<th>Date</th>
							<th>Is Done?</th>
							<th>Update Todo</th>
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
								<td><a class="btn btn-warning"
									href="/update-todo?id=${todo.id}"><span
										class="glyphicon glyphicon-pencil"></span></a></td>
								<td><a class="btn btn-danger"
									href="/delete-todo?id=${todo.id}"><span
										class="glyphicon glyphicon-trash"></span></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br />
				<div>
					<a class="btn btn-success" href="/add-todo"><span
						class="glyphicon glyphicon-plus"></span> Add a Todo</a>
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