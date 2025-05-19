<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter ou Modifier Étudiant</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">
        <c:choose>
            <c:when test="${not empty etudiant}">Modifier l'étudiant</c:when>
            <c:otherwise>Ajouter un étudiant</c:otherwise>
        </c:choose>
    </h2>

    <form method="post" action="etudiant">
        <c:if test="${not empty etudiant}">
            <input type="hidden" name="id" value="${etudiant.id}" />
            <input type="hidden" name="action" value="modifier" />
        </c:if>

        <c:if test="${empty etudiant}">
            <input type="hidden" name="action" value="ajouter" />
        </c:if>

        <div class="mb-3">
            <label for="nom" class="form-label">Nom</label>
            <input type="text" class="form-control" id="nom" name="nom"
                   value="${etudiant.nom}" required>
        </div>

        <div class="mb-3">
            <label for="prenom" class="form-label">Prénom</label>
            <input type="text" class="form-control" id="prenom" name="prenom"
                   value="${etudiant.prenom}" required>
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email"
                   value="${etudiant.email}" required>
        </div>

        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${not empty etudiant}">Mettre à jour</c:when>
                <c:otherwise>Ajouter</c:otherwise>
            </c:choose>
        </button>
        <a href="etudiant" class="btn btn-secondary">Annuler</a>
    </form>
</div>
</body>



</html>
