package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.GestionProduit;
import dao.GestionProduitJPA;
import dao.IGestionProduit;
import entity.Produit;

@WebServlet(urlPatterns = {"/", "/acceuil2", "/search", "/delete", "/edit", "/update","/add"})
public class Controleur extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IGestionProduit gestion;

    public Controleur() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
        //gestion = new GestionProduit();
        gestion = new GestionProduitJPA();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.equals("/") || path.equals("/accueil2")) {
		    List<Produit> liste = gestion.getAllProduit();
		    request.setAttribute("products", liste);
		    request.getRequestDispatcher("accueil2.jsp").forward(request, response);
		} 
		else if (path.equals("/search")) {
		    String mc = request.getParameter("r");
		    if (mc != null && !mc.trim().isEmpty()) {
		        List<Produit> produits = gestion.getProduitsByMC(mc);
		        request.setAttribute("products", produits);
		    }
		    request.getRequestDispatcher("acceil.jsp").forward(request, response);
		} 
		else if (path.equals("/delete")) {
		    String id = request.getParameter("id");
		    if (id != null && id.matches("\\d+")) {
		        gestion.deleteProduit(Integer.parseInt(id));
		    }
		    response.sendRedirect(request.getContextPath() + "/acceuil2");
		} 
		else if (path.equals("/edit")) {
		    String id = request.getParameter("id");
		    if (id != null && id.matches("\\d+")) {
		        Produit produit = gestion.getProduit(Integer.parseInt(id));
		        if (produit != null) {
		            request.setAttribute("produit", produit);
		            request.getRequestDispatcher("ajouterProduit2.jsp").forward(request, response);
		        } else {
		            response.sendRedirect(request.getContextPath() + "/acceil");
		        }
		    } else {
		        response.sendRedirect(request.getContextPath() + "/acceil");
		    }
		} 
		else if (path.equals("/add") && request.getMethod().equalsIgnoreCase("post")) {
		    String nom = request.getParameter("nom");
		    String prixStr = request.getParameter("prix");
		    String quantiteStr = request.getParameter("quantite");
		    String idStr = request.getParameter("id");

		    if (nom != null && !nom.trim().isEmpty() && prixStr.matches("\\d+(\\.\\d+)?") && quantiteStr.matches("\\d+")) {
		        double prix = Double.parseDouble(prixStr);
		        int quantite = Integer.parseInt(quantiteStr);
		        Produit p = new Produit(quantite, nom, prix, quantite);

		        if (idStr != null && idStr.matches("\\d+") && Integer.parseInt(idStr) != 0) {
		            p.setId(Integer.parseInt(idStr));
		            gestion.updateProduit(p);
		        } else {
		            gestion.adProduit(p);
		        }
		    }
		    request.setAttribute("products", gestion.getAllProduit());
		    response.sendRedirect(request.getContextPath() + "/acceil");
		}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
