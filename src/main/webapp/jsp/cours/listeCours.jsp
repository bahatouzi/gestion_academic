<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Cours" %>
<%@ include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Cours</title>    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">

    <h2 class="text-center text-primary mb-4">Liste des Cours</h2>

    <a href="cours?action=form" class="btn btn-success mb-3">Ajouter un cours</a>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Titre</th>
                <th>Description</th>
                <th>Professeur</th>
                <th>Étudiants inscrits</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty cours}">
                    <c:forEach var="c" items="${cours}">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.titre}</td>
                            <td>${c.description}</td>
                            <td>${c.professeur.nom}</td>
                            <td>
                                <ul class="list-unstyled mb-0">
                                    <c:forEach var="e" items="${c.etudiants}">
                                        <li>${e.nom} ${e.prenom}</li>
                                    </c:forEach>
                                </ul>
                            </td>
                            <td>
                                <a href="cours?action=form&id=${c.id}" class="btn btn-warning btn-sm">✏️</a>
                                <a href="cours?action=delete&id=${c.id}" class="btn btn-danger btn-sm" onclick="return confirm('Supprimer ce cours ?');">🗑️</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6" class="text-center">Aucun cours trouvé.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

</body>
</html>
