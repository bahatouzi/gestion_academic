<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Gestion Académique</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
        <a class="navbar-brand" href="#">🎓 Gestion Académique</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="etudiant">Étudiants</a></li>
                <li class="nav-item"><a class="nav-link" href="professeur">Professeurs</a></li>
                <li class="nav-item"><a class="nav-link" href="cours">Cours</a></li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
    <h1 class="text-center text-primary mb-4">🏫 Bienvenue sur la plateforme de gestion académique</h1>
    <p class="text-center lead mb-5">Sélectionnez un module pour commencer :</p>

    <div class="row justify-content-center">
        <div class="col-md-3">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">👨‍🎓 Étudiants</h5>
                    <p class="card-text">Ajouter, modifier ou supprimer des étudiants.</p>
                    <a href="etudiant" class="btn btn-primary">Gérer</a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">👩‍🏫 Professeurs</h5>
                    <p class="card-text">Gestion des enseignants et affectations.</p>
                    <a href="professeur" class="btn btn-primary">Gérer</a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">📚 Cours</h5>
                    <p class="card-text">Créer et attribuer des cours aux étudiants.</p>
                    <a href="cours" class="btn btn-primary">Gérer</a>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
