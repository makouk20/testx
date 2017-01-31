package tn.iit.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ClientBancaire;
import model.CompteBancaire;
import tn.iit.dao.ClientBancaireLocal;

import tn.iit.dao.CompteBancaireLocal;

/**
 * Servlet implementation class CompteServlet
 */
@WebServlet("/CompteServlet")
public class CompteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@EJB
	CompteBancaireLocal impl;
	@EJB
	ClientBancaireLocal c_impl;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String cin = request.getParameter("id");
		ClientBancaire client = c_impl.getClientBancaire(cin);
		session.setAttribute("cli", client);
		request.setAttribute("comptes", impl.ListComptesClient(client));
		request.getRequestDispatcher("banques.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if (action != null && action.equals("Valider")) {

			double solde = Double.parseDouble(request.getParameter("solde"));
			ClientBancaire client = (ClientBancaire) session.getAttribute("cli");
			CompteBancaire cb = new CompteBancaire(solde, client);
			impl.addCompte(cb);
		} else if (action != null && action.equals("supp")) {

			long rib = Long.parseLong(request.getParameter("rib"));
			impl.removeCompte(rib);
		} else if (action != null && action.equals("Deposer")) {
			double solde = Double.parseDouble(request.getParameter("sld"));
			long rib = Long.parseLong(request.getParameter("rib"));
			impl.verser(rib, solde);

		} else if (action != null && action.equals("Retirer")) {
			double solde = Double.parseDouble(request.getParameter("slde"));
			long rib = Long.parseLong(request.getParameter("rib"));
			impl.retirer(rib, solde);

		}
		request.setAttribute("comptes", impl.ListComptesClient((ClientBancaire) session.getAttribute("cli")));
		request.getRequestDispatcher("banques.jsp").forward(request, response);

	}
}
