<%@page import="java.util.List"%>
<%@page import="entity.Etudiant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des Étudiants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2>Liste des Étudiants</h2>
<a href="etudiant?action=form" class="btn btn-success mb-3">Ajouter un etudiant</a>

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
            List<Etudiant> etudiants = (List<Etudiant>) request.getAttribute("etudiants");
            for (Etudiant e : etudiants) {
        %>
        <tr>
            <td><%= e.getId() %></td>
            <td><%= e.getNom() %></td>
            <td><%= e.getPrenom() %></td>
            <td><%= e.getEmail() %></td>
        <td>
    <a href="etudiant?action=edit&id=<%= e.getId() %>" class="btn btn-warning btn-sm">✏️</a>
    <a href="professeur?action=delete&id=<%= e.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Confirmer la suppression ?');">🗑️ </a>
    
		</td>

        </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>
