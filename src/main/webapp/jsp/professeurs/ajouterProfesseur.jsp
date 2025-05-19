<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter / Modifier Professeur</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="mb-4 text-primary text-center">
    <c:choose>
        <c:when test="${not empty professeur}">Modifier un professeur</c:when>
        <c:otherwise>Ajouter un professeur</c:otherwise>
    </c:choose>
</h2>

<form method="post" action="professeur">
    <input type="hidden" name="action" value="<c:choose><c:when test='${not empty professeur}'>modifier</c:when><c:otherwise>ajouter</c:otherwise></c:choose>">
    
    <c:if test="${not empty professeur}">
        <input type="hidden" name="id" value="${professeur.id}">
    </c:if>

    <div class="mb-3">
        <label for="nom" class="form-label">Nom</label>
        <input type="text" class="form-control" id="nom" name="nom" value="${professeur.nom}" required>
    </div>
    
    <div class="mb-3">
        <label for="prenom" class="form-label">Prenom</label>
        <input type="text" class="form-control" id="prenom" name="prenom" value="${professeur.prenom}" required>
    </div>

    <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" value="${professeur.email}" required>
    </div>

    <div class="d-flex justify-content-between">
        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${not empty professeur}">Mettre à jour</c:when>
                <c:otherwise>Ajouter</c:otherwise>
            </c:choose>
        </button>
        <a href="professeur" class="btn btn-secondary">Annuler</a>
    </div>
</form>

</body>
</html>
