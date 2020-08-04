<title>Welcome Page</title>
</head>
<body>
	<%@ include file="common/header.jspf"%>
	<%@ include file="common/navigation.jspf"%>
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