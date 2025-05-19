package web;

import dao.GestionCoursJPA;
import dao.GestionEtudiantJPA;
import dao.IGestionEtudiant;
import entity.Cours;
import entity.Etudiant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/etudiant")
public class EtudiantServlet extends HttpServlet {
    private IGestionEtudiant service;

    @Override
    public void init() throws ServletException {
        service = new GestionEtudiantJPA();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "form":
                request.getRequestDispatcher("jsp/etudiants/ajouterEtudiant.jsp").forward(request, response);
                break;

            case "edit":
                String idEditStr = request.getParameter("id");
                if (idEditStr != null && !idEditStr.isEmpty()) {
                    Etudiant etu = service.getEtudiant(Integer.parseInt(idEditStr));
                    request.setAttribute("etudiant", etu);
                    request.getRequestDispatcher("jsp/etudiants/ajouterEtudiant.jsp").forward(request, response);
                } else {
                    response.sendRedirect("etudiant");
                }
                break;

            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("id"));
                service.supprimerEtudiant(idDelete);
                response.sendRedirect("etudiant");
                break;

            case "inscription":
                request.setAttribute("etudiants", service.getAllEtudiants());
                request.setAttribute("cours", new GestionCoursJPA().getAllCours());
                request.getRequestDispatcher("jsp/etudiants/inscriptionCours.jsp").forward(request, response);
                break;

            default:
                List<Etudiant> liste = service.getAllEtudiants();
                request.setAttribute("etudiants", liste);
                request.getRequestDispatcher("jsp/etudiants/listeEtudiants.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "ajouter":
            case "modifier":
                String idStr = request.getParameter("id");
                String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
                String email = request.getParameter("email");

                Etudiant e = new Etudiant();
                e.setNom(nom);
                e.setPrenom(prenom);
                e.setEmail(email);

                if (idStr != null && !idStr.isEmpty()) {
                    e.setId(Integer.parseInt(idStr));
                    service.modifierEtudiant(e);
                } else {
                    service.ajouterEtudiant(e);
                }

                response.sendRedirect("etudiant");
                break;

            case "inscrire":
                int etudiantId = Integer.parseInt(request.getParameter("etudiantId"));
                String[] coursIds = request.getParameterValues("coursIds");

                Etudiant etudiant = service.getEtudiant(etudiantId);
                List<Cours> coursList = new ArrayList<>();

                if (coursIds != null) {
                    GestionCoursJPA coursService = new GestionCoursJPA();
                    for (String cid : coursIds) {
                        int id = Integer.parseInt(cid);
                        Cours cours = coursService.getCours(id);
                        coursList.add(cours);
                    }
                }

                etudiant.setCours(coursList);
                service.modifierEtudiant(etudiant);
                response.sendRedirect("etudiant");
                break;
        }
    }
}
