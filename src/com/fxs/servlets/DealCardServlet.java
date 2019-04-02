package com.fxs.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fxs.Games.*;

import java.io.PrintWriter;
import java.util.LinkedList;

public class DealCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DealCardServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
	    Blackjack game = (Blackjack) session.getServletContext().getAttribute("gameName");

	    String playerIndex = request.getParameter("playerIndex");
	    String playerCommand = request.getParameter("playerCommand");
	    
	    int iPlayerIndex = Integer.valueOf(playerIndex);
	    
	    Card card = new Card();
	    
		if (playerCommand.equals("hit")) {
			LinkedList<Card> cards = game.getDeck();
			card = cards.pop();
		}
		
	    response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
           
        String imageName = "";
      
        PrintWriter out = response.getWriter();
        String message = "";
        
        BlackjackHand h = game.getHand(iPlayerIndex);
    	boolean foundHitIndex = false;
		String strHandValue = "";
		int handValue = 0;
    	for(int c=0;c<6;c++) {
    		if (h.getCard(c) != null) {
    			imageName = "images/" + h.getCard(c).getImageName() + ".gif";
    			message += "<div class='col col-1 pull-left'><img border='0' src='" + imageName + "' width='49' height='66'></div>";

    		}
    		else {
    			if (playerCommand.equals("hit") && !foundHitIndex){
    				foundHitIndex = true;
   					h.add(c, card);
        			imageName = "images/" + h.getCard(c).getImageName() + ".gif";
            		strHandValue = String.valueOf(h.computeHandValue());
            		handValue = Integer.valueOf(strHandValue);
        			message += "<div class='col col-1 pull-left'><img border='0' src='" + imageName + "' width='49' height='66'></div>";
    			}
    		}
    	}
    		if (handValue > 21){
				message +=  "<div class='col col-1 pull-left' width='20'>BUSTED</div>";
    			
    		}
    		
    		if ((playerCommand.equals("hit")||playerCommand.equals("next")) && (handValue < 21)) {
    			String hitString = "\"hit\"";
    			String standString = "\"stand\"";
    			message += "<div class='col col-1 pull-left'><input class='btn btn-primary' type='button' value='Hit'  onclick='command(" + playerIndex + "," + hitString + ")' /></div>";
    			message += "<div class='col col-1 pull-left'><input class='btn btn-danger' type='button' value='Stand' onclick='command(" + playerIndex + "," + standString + ")' /></div>";       
    			
    		}
    	System.out.println(message);
        out.print(message);

	}

}
