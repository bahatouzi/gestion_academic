package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GestionProduit;
import dao.IGestionProduit;
import entity.Produit;

/**
 * Servlet implementation class Firstservlet
 */
@WebServlet("/index.php")
public class Firstservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Firstservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    IGestionProduit gestionProduit;
	public void init(ServletConfig config) throws ServletException {
		gestionProduit = new GestionProduit();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Produit>liste=gestionProduit.getAllProduit();
		PrintWriter out=response.getWriter();
		out.print("<html><body><table>");
		
		//list.forEach(p->out.println("<tr><td>"+p.getNom()+"</td><td>"+p.getPrix()+"</td><tr>"))
		  	
		for(Produit p:liste)
			out.println("<tr><td>"+p.getNom()+"</td><td>"+p.getPrix()+"</td><tr>");
		out.println("</table></body></</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
