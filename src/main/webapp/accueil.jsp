<%@page import="entity.Produit"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Produits</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <%@include file="header.html" %>

    <div class="container mt-4">
        <h2 class="text-center">Liste des Produits</h2>

        <form method="get" action="search" class="d-flex justify-content-center mb-3">
            <input type="text" name="mc" class="form-control w-50" placeholder="Rechercher un produit...">
            <button type="submit" class="btn btn-primary ms-2">Rechercher</button>
        </form>

        <% List<Produit> liste = (List<Produit>) request.getAttribute("products"); %>

        <table class="table table-bordered table-striped table-hover">
            <thead class="table-dark">
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
                                <a href="update?id=<%= p.getId() %>" class="btn btn-warning">Modifier</a>
                                <a href="delete?id=<%= p.getId() %>" class="btn btn-danger"
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce produit ?');">Supprimer</a>
                            </td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr><td colspan="5" class="text-center text-danger">Aucun produit disponible.</td></tr>
                <% } %>
            </tbody>
        </table>

        <div class="text-center">
            <a href="ajout" class="btn btn-success">Ajouter un produit</a>
        </div>
    </div>
</body>
</html>
