<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Cours" %>
<%@ page import="entity.Etudiant" %>
<%@ include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inscription aux Cours</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h2>Inscrire l'étudiant : ${etudiant.nom} ${etudiant.prenom}</h2>

    <form method="post" action="etudiant">
        <input type="hidden" name="action" value="inscrireCours"/>
        <input type="hidden" name="id" value="${etudiant.id}"/>

        <div class="mb-3">
            <label class="form-label">Cours disponibles :</label><br/>
            <c:forEach var="c" items="${cours}">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="coursIds" value="${c.id}"
                        <c:if test="${etudiant.cours.contains(c)}">checked</c:if> />
                    <label class="form-check-label">${c.titre}</label>
                </div>
            </c:forEach>
        </div>

        <button type="submit" class="btn btn-primary">Enregistrer l'inscription</button>
        <a href="etudiant" class="btn btn-secondary">Annuler</a>
    </form>
</body>
</html>
