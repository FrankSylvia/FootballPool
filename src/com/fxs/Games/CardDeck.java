package com.fxs.Games;

import java.util.ArrayList;

public class CardDeck {


	public ArrayList<Card> deck = new ArrayList<Card>();

	
	public CardDeck() {
		// TODO Auto-generated constructor stub

		String suits[] = { "clubs", "diamonds","hearts","spades"};
		for(int s=0;s<4;s++) {		
			for(int i=2;i<=14;i++) {
				Card card = new Card(i,suits[s]);
				deck.add(card);
			}			
		}
		
	}
	
	public ArrayList<Card> getDeck() {
		
		return deck;
	}

}
