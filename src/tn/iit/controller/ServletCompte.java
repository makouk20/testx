package tn.iit.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Compte;
import tn.iit.dao.BanqueLocal;

/**
 * Servlet implementation class ServletCompte
 */
@WebServlet("/ServletCompte")
public class ServletCompte extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletCompte() {
		super();
		// TODO Auto-generated constructor stub
	}

	@EJB
	BanqueLocal impl;

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
		String action = request.getParameter("action");
		if (action != null && action.equals("Valider")) {
			String nomClient = request.getParameter("nomClient");
			float solde = Float.parseFloat(request.getParameter("solde"));
			Compte cp = new Compte(nomClient, solde);
			impl.addCompte(cp);
		} else if (action != null && action.equals("supp")) {
			int rib = Integer.parseInt(request.getParameter("rib"));		
			impl.removeCompte(rib);
		} else if (action!=null && action.equals("edit")) {
			int rib = Integer.parseInt(request.getParameter("cod"));
			impl.getCompte(rib);
			request.setAttribute("compte", rib);
		}

		request.setAttribute("comptes", impl.ListComptes());
		request.getRequestDispatcher("compte.jsp").forward(request, response);
	}

}
