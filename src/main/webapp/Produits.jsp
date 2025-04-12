<%@page import="entity.Produit"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des Produits</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<%@include file="header.html" %>

<div class="container mt-4">
    <h2 class="text-center">Liste des Produits</h2>

    <% List<Produit> liste = (List<Produit>) request.getAttribute("products"); %>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prix</th>
                <th>Quantité</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% if (liste != null && !liste.isEmpty()) { %>
                <% for (Produit p : liste) { %>
                    <tr>
                        <td><%= p.getId() %></td>
                        <td><%= p.getNom() %></td>
                        <td><%= p.getPrix() %> €</td>
                        <td><%= p.getQuanite() %></td>
                        <td>
                            <a href="delete?id=<%= p.getId() %>" class="btn btn-danger">Supprimer</a>
                            <a href="update?id=<%= p.getId() %>" class="btn btn-warning">Modifier</a>
                        </td>
                    </tr>
                <% } %>
            <% } else { %>
                <tr><td colspan="5" class="text-center">Aucun produit disponible.</td></tr>
            <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
