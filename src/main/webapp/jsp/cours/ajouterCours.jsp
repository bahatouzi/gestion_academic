<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter / Modifier Cours</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="text-primary text-center">Ajouter ou Modifier un Cours</h2>

<form method="post" action="cours">
    <c:if test="${cours != null}">
        <input type="hidden" name="id" value="${cours.id}" />
    </c:if>

    <div class="mb-3">
        <label>Titre du cours</label>
        <input type="text" class="form-control" name="titre" value="${cours.titre}" required>
    </div>

    <div class="mb-3">
        <label>Description</label>
        <textarea class="form-control" name="description" required>${cours.description}</textarea>
    </div>

    <div class="mb-3">
        <label>Professeur</label>
        <select name="professeurId" class="form-control" required>
            <option hidden selected>Choisir un professeur</option>
            <c:forEach var="p" items="${professeurs}">
                <option value="${p.id}" <c:if test="${cours.professeur.id == p.id}">selected</c:if>>
                    ${p.nom} - ${p.email}
                </option>
            </c:forEach>
        </select>
    </div>

    <div class="mb-3">
        <label>Étudiants inscrits</label>
        <c:forEach var="e" items="${etudiants}">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="etudiantIds" value="${e.id}"
                    <c:if test="${cours != null && cours.etudiants.contains(e)}">checked</c:if> />
                <label class="form-check-label">${e.nom} ${e.prenom} (${e.email})</label>
            </div>
        </c:forEach>
    </div>

    <button type="submit" class="btn btn-primary">Valider</button>
    <a href="cours" class="btn btn-secondary">Retour</a>
</form>

</body>
</html>
