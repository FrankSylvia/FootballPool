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

		String winningPlayers = "";
		String pushPlayers = "";
		String losingPlayers = "";

		System.out.println("ResultsServlet version 1.7");
		HttpSession session = request.getSession();
	    Blackjack game = (Blackjack) session.getServletContext().getAttribute("gameName");

	    game = (Blackjack) session.getServletContext().getAttribute("gameName");
	    int dealerValue = game.getHand(game.getPlayerCount()-1).computeHandValue();
    	System.out.println("Dealer Value: " + dealerValue);
	    for (int x=0;x<game.getPlayerCount()-1;x++) { 
	    	BlackjackHand h = game.getHand(x);
	    	System.out.println(game.getPlayerName(x) + " " + h.computeHandValue());
	    	if (h.computeHandValue() > 21) {
	    		losingPlayers = losingPlayers + game.getPlayerName(x) + " ";
	    	}
	    	else {
	    		if ((dealerValue > 21)) {
	    			winningPlayers = winningPlayers + game.getPlayerName(x) + " ";
	    		}
	    		else {
	    			if (h.computeHandValue() < dealerValue) {
	    				//highHand = h.getValue();
	    				losingPlayers = losingPlayers + game.getPlayerName(x) + " ";
	    			}
	    			else if (h.computeHandValue() > dealerValue) {
	    				//highHand = h.getValue();
	    				winningPlayers = winningPlayers + game.getPlayerName(x) + " ";
	    			}
	    			else if (h.computeHandValue() == dealerValue) {
	    				//highHand = h.getValue();
	    				pushPlayers = pushPlayers + h.getPlayerName() + " ";
	    			}
	    		}
	    	}
	    }
	    
        PrintWriter out = response.getWriter();
        String message = winningPlayers + "," + pushPlayers + "," + losingPlayers;
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");        
        System.out.println(message);
        out.print(message);
 
	}

}
