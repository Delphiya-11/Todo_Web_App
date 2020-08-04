<title>Todos for ${name}</title>
</head>
<body>
	<%@ include file="common/header.jspf" %>
	<%@ include file="common/navigation.jspf" %>
	<br />
	<div class="container">
		<h2>Here's a list of ${name}'s todos:</h2>
		<br /> <br />
		<table class="table table-striped">
			<caption>Your Todos are</caption>
			<thead>
				<tr>
					<th>Description</th>
					<th>Target Date</th>
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
							href="/update-todo?id=${todo.id}">Update</a></td>
						<td><a class="btn btn-danger"
							href="/delete-todo?id=${todo.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br />
		<div>
			<a class="btn btn-success" href="/add-todo">Add a Todo</a>
		</div>
	</div>
	<%@ include file="common/footer.jspf" %>
</body>
</html>