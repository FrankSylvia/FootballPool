package com.fxs.Games;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;

public class CardGame {
	
    private String playerName[] = {" "," "," "," "," "," "," "};
	public ArrayList<Card> deck;
	public LinkedList<Card> queue;
	public CardGame() {
		
		CardDeck cards = new CardDeck();
		
		deck = cards.getDeck();

		shuffle();
		
		queue = new LinkedList<Card>(deck);

	}
	
	public LinkedList<Card> getDeck() {
		return queue;
	}
	
	public void shuffle() {	
		long seed = System.currentTimeMillis() % 100;
		for (long t=0;t<seed;t++) {
			for (int i=0;i<25;i++) {
				Collections.shuffle(deck);
			}
		}
	}
	
	int getCardsInHand(){ return 0; };
	void setCardsInHand(int cards) {} ;
	int getPlayerCount(){ return 0; };
	void setPlayerCount(int players) {};

	public String getPlayerName(int seat) {
    	return playerName[seat];
    }
    public void setPlayerName(int seat, String name) {
    	this.playerName[seat] = name;
    }
    
}
