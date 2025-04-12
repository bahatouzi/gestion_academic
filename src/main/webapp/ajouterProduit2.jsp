<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Produits</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .navbar-brand {
            font-weight: bold;
            color: #ffffff !important;
        }
        .nav-link {
            color: #ffffff !important;
            font-weight: 600;
        }
        .nav-link:hover {
            color: #d1d1d1 !important;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
    </style>
</head>
<body>

    
    <nav class="navbar navbar-expand-lg bg-primary shadow-sm px-4">
        <a class="navbar-brand d-flex align-items-center" href="acceuil2">
            Gestion des Produits
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="acceuil2">
                        <i class="bi bi-house-door"></i> Accueil
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    
    <div class="container d-flex justify-content-center align-items-center mt-5">
        <div class="card p-4" style="width: 50%;">
            <h2 class="text-center text-primary">Ajout ou modification d'un produit</h2>
            
            <form method="post" action="add">
               
                <c:if test="${not empty produit}">
                    <input type="hidden" name="id" value="${produit.id}">
                </c:if>

                <div class="mb-3">
                    <label for="nom" class="form-label">Nom du produit</label>
                    <input type="text" class="form-control" id="nom" name="nom" value="${produit.nom}" required>
                </div>

                <div class="mb-3">
                    <label for="prix" class="form-label">Prix</label>
                    <input type="number" step="0.01" class="form-control" id="prix" name="prix" value="${produit.prix}" required>
                </div>

                <div class="mb-3">
                    <label for="quanite" class="form-label">Quantit�</label>
                    <input type="number" class="form-control" id="quantite" name="quantite" value="${produit.quantite}" required>
                </div>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary px-4">
                        <i class="bi bi-save"></i> 
                        <c:choose>
                            <c:when test="${not empty produit}">Mettre � jour</c:when>
                            <c:otherwise>Ajouter</c:otherwise>
                        </c:choose>
                    </button>
                    <a href="acceuil2" class="btn btn-danger px-4">
                        <i class="bi bi-x-circle"></i> Annuler
                    </a>
                </div>
            </form>
        </div>
    </div>

   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
