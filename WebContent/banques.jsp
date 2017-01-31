<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function confirmation(rib) {
		var conf = confirm("Etes vous sure de vouloir supprimer?");

		if (conf) {

			document.location = "CompteServlet?action=supp&rib=" + rib;

		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="3.jpg">

	<center>
		<h1>Comptes Client</h1>
	</center>
	<br>
	<br>
	<hr>
	<b>Client</b>: ${cli.nom } ${cli.prenom }
	<font color="red"> ${cli.cin} </font>
	<form method="post" action="CompteServlet">
		Solde : <input type="text" name="solde" /> <input type="submit"
			name="action" value="Valider">

	</form>
	<table>
		<tr>

			<th>Rib</th>
			<th>Solde</th>
			<th>Supprimer</th>
			<th>Déposer</th>
			<th>Retirer</th>
			<th>Transférer</th>
		</tr>


		<tbody>
			<c:forEach items="${comptes}" var="c">
				<tr>

					<td>${c.rib }</td>
					<td>${c.solde }</td>
					<td><a href="javascript:confirmation('${c.rib}')">supprimer
					</a></td>
					<td>
					<form method="post" action="CompteServlet?rib=${c.rib }">
							<input type="text" name="sld" /> <input type="submit"
								name="action" value="Deposer">
						</form>
						</td>
						<td><form method="post" action="CompteServlet?rib=${c.rib }">
							<input type="text" name="slde" /> <input type="submit"
								name="action" value="Retirer">
						</form></td>
				</tr>
		</tbody>
		</c:forEach>
	</table>
</body>
</html>