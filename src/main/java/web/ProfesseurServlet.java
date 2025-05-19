package web;

import dao.GestionProfesseurJPA;
import dao.IGestionProfesseur;
import entity.Professeur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/professeur")
public class ProfesseurServlet extends HttpServlet {
    private IGestionProfesseur service;

    @Override
    public void init() throws ServletException {
        service = new GestionProfesseurJPA();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "form":
                // Formulaire vide ou rempli si édition
                String idStr = request.getParameter("id");
                if (idStr != null && !idStr.isEmpty()) {
                    int id = Integer.parseInt(idStr);
                    Professeur prof = service.getProfesseur(id);
                    request.setAttribute("professeur", prof);
                }
                request.getRequestDispatcher("jsp/professeurs/ajouterProfesseur.jsp").forward(request, response);
                break;

            case "delete":
                int idToDelete = Integer.parseInt(request.getParameter("id"));
                service.supprimerProfesseur(idToDelete);
                response.sendRedirect("professeur");
                break;

            default:
                List<Professeur> liste = service.getAllProfesseurs();
                request.setAttribute("professeurs", liste);
                request.getRequestDispatcher("jsp/professeurs/listeProfesseurs.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");

        Professeur p = new Professeur();
        p.setNom(nom);
        p.setPrenom(prenom);
        p.setEmail(email);

        if (idStr != null && !idStr.isEmpty()) {
            p.setId(Integer.parseInt(idStr));
            service.modifierProfesseur(p);
        } else {
            service.ajouterProfesseur(p);
        }

        response.sendRedirect("professeur");
    }
}
