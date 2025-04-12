<%@page import="entity.Produit"%>
<%@include file="header.html" %>

<% 
    Produit p = (Produit) request.getAttribute("produit");
    if (p == null) {
        p = new Produit("", 0.0, 0); // Assurez-vous que le constructeur existe
    }
%>

<div class="card-header">
    <h2 class="text-center"><%= (p.getId() == 0) ? "Ajouter un nouveau produit" : "Modifier le produit" %></h2>

    <form method="post" action="ajouter" class="form-group">
        <input type="hidden" name="id" value="<%= p.getId() %>">
        
        <div class="card-body">
            <label class="form-label">Nom</label>
            <input type="text" name="nom" class="form-control" value="<%= p.getNom() %>" required>
        </div>
        
        <div class="form-group">
            <label class="form-label">Prix</label>
            <input type="number" step="0.01" name="prix" class="form-control" value="<%= p.getPrix() %>" required>
        </div>
        
        <div class="form-group">
            <label class="form-label">Quantité</label>
            <input type="number" name="quanite" class="form-control" value="<%= p.getQuanite() %>" required>
        </div>
        
        <button type="submit" class="btn btn-primary"><%= (p.getId() == 0) ? "Ajouter" : "Modifier" %></button>
    </form>
</div>
