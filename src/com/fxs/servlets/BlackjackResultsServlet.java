package com.fxs.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fxs.Games.*;

import java.io.PrintWriter;

public class BlackjackResultsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BlackjackResultsServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String winningPlayer = "";
		String pushPlayer = "";
		String losingPlayer = "";

		System.out.println("ResultsServlet version 1.1");
		HttpSession session = request.getSession();
	    Blackjack game = (Blackjack) session.getServletContext().getAttribute("gameName");

	    game = (Blackjack) session.getServletContext().getAttribute("gameName");
	    int dealerValue = game.getHand(game.getPlayerCount()-1).computeHandValue();
	    for (int x=0;x<game.getPlayerCount();x++) { 
	    	BlackjackHand h = game.getHand(x);
	    	System.out.println(game.getPlayerName(x) + " " + h.computeHandValue());
	    	if (h.computeHandValue() > 21) {
	    		losingPlayer = losingPlayer + game.getPlayerName(x) + " ";
	    	}
	    	else if (h.computeHandValue() < dealerValue && (x < game.getPlayerCount()-1)) {
	    		//highHand = h.getValue();
	    		losingPlayer = losingPlayer + game.getPlayerName(x) + " ";
	    	}
	    	else if (h.computeHandValue() > dealerValue && (x < game.getPlayerCount()-1)) {
	    			//highHand = h.getValue();
	    		winningPlayer = winningPlayer + game.getPlayerName(x) + " ";
	    	}
	    	else if (h.computeHandValue() == dealerValue && (x < game.getPlayerCount()-1)) {
	    		//highHand = h.getValue();
	    		pushPlayer = pushPlayer + h.getPlayerName() + " ";
	    	}
	    }
      
        PrintWriter out = response.getWriter();


        String message = 
        	"<TABLE>" 
        	+ "<TR><TD>Winning Players :" + winningPlayer + "</TD></TR>"
        	+ "<TR><TD>Push Players    :" + pushPlayer + "</TD></TR>"
        	+ "<TR><TD>Losing Players  :" + losingPlayer + "</TD></TR>"
        	+ "</TABLE>";
    	System.out.println(message);
        out.print(message);
 
	}

}
