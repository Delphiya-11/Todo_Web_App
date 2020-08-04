<title>Add Todo Page</title>
</head>
<body>
	<%@ include file="common/header.jspf"%>
	<%@ include file="common/navigation.jspf"%>
	<br />
	<div class="container">
		<h2>Add todo for ${name}</h2>
		<br />
		<form:form method="post" modelAttribute="todo">
			<form:hidden path="id" />
			<fieldset class="form-group">
				<form:label path="description">Description</form:label>
				<form:input path="description" type="text"
					placeholder="Descripton of task" class="form-control"
					required="required" />
				<form:errors path="description" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<form:label path="targetDate">Target Date</form:label>
				<form:input path="targetDate" type="text" class="form-control"
					required="required" />
				<form:errors path="targetDate" cssClass="text-warning" />
			</fieldset>
			<br />
			<br />
			<input class="btn btn-success" type="submit" value="Submit" />
		</form:form>
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
