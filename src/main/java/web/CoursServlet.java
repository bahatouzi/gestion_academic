package web;

import dao.GestionCoursJPA;
import dao.GestionEtudiantJPA;
import dao.GestionProfesseurJPA;
import dao.IGestionCours;
import dao.IGestionEtudiant;
import dao.IGestionProfesseur;
import entity.Cours;
import entity.Etudiant;
import entity.Professeur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cours")
public class CoursServlet extends HttpServlet {
    private IGestionCours service;
    private IGestionProfesseur serviceProf;
    private IGestionEtudiant serviceEtudiant;

    @Override
    public void init() throws ServletException {
        service = new GestionCoursJPA();
        serviceProf = new GestionProfesseurJPA();
        serviceEtudiant = new GestionEtudiantJPA();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "form":
                req.setAttribute("professeurs", serviceProf.getAllProfesseurs());
                req.setAttribute("etudiants", serviceEtudiant.getAllEtudiants());

                String idStr = req.getParameter("id");
                if (idStr != null) {
                    int id = Integer.parseInt(idStr);
                    Cours c = service.getCours(id);
                    req.setAttribute("cours", c);
                }

                req.getRequestDispatcher("/jsp/cours/ajouterCours.jsp").forward(req, res);
                break;

            case "delete":
                int id = Integer.parseInt(req.getParameter("id"));
                service.supprimerCours(id);
                res.sendRedirect("cours");
                break;

            default:
                List<Cours> coursList = service.getAllCours();
                req.setAttribute("cours", coursList);
                req.getRequestDispatcher("/jsp/cours/listeCours.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String titre = req.getParameter("titre");
        String description = req.getParameter("description");
        String idProfStr = req.getParameter("professeurId");
        String[] etudiantsIds = req.getParameterValues("etudiantIds");
        String idStr = req.getParameter("id");

        Cours c = new Cours();
        c.setTitre(titre);
        c.setDescription(description);

        if (idProfStr != null && !idProfStr.isEmpty()) {
            int idProf = Integer.parseInt(idProfStr);
            c.setProfesseur(serviceProf.getProfesseur(idProf));
        }

        if (etudiantsIds != null) {
            List<Etudiant> selectedEtudiants = new ArrayList<>();
            for (String idE : etudiantsIds) {
                Etudiant e = serviceEtudiant.getEtudiant(Integer.parseInt(idE));
                if (e != null) selectedEtudiants.add(e);
            }
            c.setEtudiants(selectedEtudiants);
        }

        if (idStr != null && !idStr.isEmpty()) {
            c.setId(Integer.parseInt(idStr));
            service.modifierCours(c);
        } else {
            service.ajouterCours(c);
        }

        res.sendRedirect("cours");
    }
}
