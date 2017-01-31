<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compte</title>
<script type="text/javascript">
function confirmation(rib){
	var conf=confirm("Etes vous sure de vouloir supprimer?");
	
	if(conf)
	{	
	
		document.location="ServletCompte?action=supp&rib="+rib;
		
		
	} 
}

</script>
</head>
<body>
	<form method="post" action="ServletCompte">
		Nom Client<input type="text" name="nomClient" value="${compte.nomClient}" size="20" maxlength="20" /><br>
	    Solde<input type="text" name="solde" value="${compte.solde}" size="20" maxlength="20" /> <br>
			<input type="submit" name="action" value="Valider">
            <input type="submit" name="action" value="Update">


	</form>
	<table border="1">
		<tr>
			<td>RIB</td>
			<td>Nom client</td>
			<td>Solde</td>
		</tr>
		<c:forEach items="${comptes}" var="c">


			<tr>
				<td>${c.rib}</td>

				<td>${c.nomClient}</td>
				<td>${c.solde}</td>
               <td><a href="javascript:confirmation('${c.rib}')">Supprimer</a></td>
    <td>  <a href="ServletCompte?action=edit&cod=${c.rib}">Modifier</a></td>
			</tr>

		</c:forEach>
		</table>
</body>
</html>