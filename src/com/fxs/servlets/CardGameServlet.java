
package com.fxs.servlets;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fxs.Games.*;


public class CardGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CardGameServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String gameName = request.getParameter("Game");
		
		RequestDispatcher rd = null;

		session.getServletContext().removeAttribute("gameName");
		if (gameName.equals("Blackjack")) {
			Blackjack game = new Blackjack(6);
			
			session.getServletContext().setAttribute("gameName", game);
			rd = request.getRequestDispatcher("/Blackjack.jsp");
		} else {
			Poker game = new Poker();
			session.getServletContext().setAttribute("gameName", game);
			rd = request.getRequestDispatcher("/Poker.jsp");
		}
		rd.forward(request, response);
	}

}