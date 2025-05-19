<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Professeur" %>
<%@ include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Professeurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="text-center text-primary mb-4">Liste des Professeurs</h2>

<a href="professeur?action=form" class="btn btn-success mb-3">➕ Ajouter un professeur</a>

<table class="table table-bordered table-hover">
    <thead class="table-light">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Professeur> professeurs = (List<Professeur>) request.getAttribute("professeurs");
            if (professeurs != null && !professeurs.isEmpty()) {
                for (Professeur p : professeurs) {
        %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getNom() %></td>
                <td><%= p.getPrenom() %></td>
                <td><%= p.getEmail() %></td>
                <td>
                    <a href="professeur?action=form&id=<%= p.getId() %>" class="btn btn-warning btn-sm">✏️</a>
                    <a href="professeur?action=delete&id=<%= p.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Confirmer la suppression ?');">🗑️ </a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="4" class="text-center">Aucun professeur trouvé.</td></tr>
        <%
            }
        %>
    </tbody>
</table>

</body>
</html>
