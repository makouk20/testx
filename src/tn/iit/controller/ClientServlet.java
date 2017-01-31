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
import tn.iit.dao.ClientBancaireLocal;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ClientServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@EJB
	ClientBancaireLocal impl;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
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
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");

			ClientBancaire cb = new ClientBancaire(cin, nom, prenom, adresse);
			impl.addClient(cb);
		} else if (action != null && action.equals("supp")) {
			String cin = request.getParameter("cin");
			impl.removeClient(cin);
		}

		else if (action != null && action.equals("Update")) {
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			ClientBancaire cb = impl.getClientBancaire(cin);
			cb.setAdresse(adresse);
			cb.setNom(nom);
			cb.setPrenom(prenom);
			impl.updateClient(cb);
		}

		else if (action != null && action.equals("edit")) {
			String cin = request.getParameter("cin");
			request.setAttribute("clientx", impl.getClientBancaire(cin));
		} else if (action != null && action.equals("rd")) {
			String cin = request.getParameter("cin");
			session.setAttribute("cli", impl.getClientBancaire(cin));
			request.getRequestDispatcher("banques.jsp").forward(request, response);

		}
		request.setAttribute("client", impl.ListComptes());
		request.getRequestDispatcher("client.jsp").forward(request, response);
	}
}
