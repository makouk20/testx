<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function confirmation(cin) {
		var conf = confirm("Etes vous sure de vouloir supprimer?");

		if (conf) {

			document.location = "ClientServlet?action=supp&cin=" + cin;

		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/ico/apple-touch-icon-57-precomposed.png">
<title>Ajout Client</title>

</head>
<body>
	<form class="form-horizontal" method="post" action="ClientServlet">
		<fieldset>

			<!-- Form Name -->
			<legend>Ajout Client</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="CIN">CIN</label>
				<div class="col-md-4">
					<input id="CIN" name="cin" type="
						text"
						class="form-control input-md" value="${clientx.cin}" required="">

				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="Nom">Nom</label>
				<div class="col-md-4">
					<input id="Nom" name="nom" type="
						text"
						class="form-control input-md" value=" ${clientx.nom}" required="">

				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="Prenom">Prenom</label>
				<div class="col-md-4">
					<input id="Prenom" name="prenom" type="
						text"
						class="form-control input-md" value=" ${clientx.prenom}"
						required="">

				</div>
			</div>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="Adresse">Adresse</label>
				<div class="col-md-4">
					<input id="Adresse" name="adresse"
						text" class="form-control input-md" value=" ${clientx.adresse}"
						required="">

				</div>
			</div>

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="singlebutton"></label>
				<div class="col-md-4">

					<c:if test="${clientx==null }">
						<input type="submit" name="action" value="Valider">
					</c:if>
					<c:if test="${clientx!=null }">
						<input type="submit" name="action" value="Update">
						</td>
						</tr>
					</c:if>
				</div>
			</div>

		</fieldset>
	</form>
	<hr>

	<table class="table">
		<thead>
			<tr>

				<th>CIN</th>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Adresse</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${client}" var="c">
				<tr>

					<td>${c.cin }</td>
					<td>${c.nom }</td>
					<td>${c.prenom }</td>
					<td>${c.adresse }</td>
					<td><a class="teal-text"
						href="ClientServlet?action=edit&cin=${c.cin}"> <i
							class="fa fa-pencil"></i></a> <a class="red-text"
						href="javascript:confirmation('${c.cin}')"> <i
							class="fa fa-times"></i></a> <a class="blue-text"
						href="CompteServlet?id=${c.cin}"><i class="fa fa-user"></i></a></td>
				</tr>
		</tbody>
		</c:forEach>
		</ table>
</body>
</html>