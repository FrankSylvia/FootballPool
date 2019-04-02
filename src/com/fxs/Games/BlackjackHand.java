package com.fxs.Games;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class BlackjackHand implements Comparator<BlackjackHand>, Comparable<BlackjackHand>  {
	
	
	public int value;
	public String playerName;
	boolean handIsComplete = false;
	
	public ArrayList<Card> hand = new ArrayList<Card>();
	
	

	public BlackjackHand() {
		
	}
	
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	
	public void add(int index, Card c) {
		hand.add(index,c);
	}
	
	public Card getCard(int i) {
		Card t;
		if (i < hand.size())
			t = new Card(hand.get(i));
		else
			t = null;
		return t;
	}

	public void display() {
		for (int x=0;x<hand.size();x++) {
//			System.out.print(hand.get(x).display() + " ");
		}
//		System.out.println(" ");
	}
	
	public void sort() {
		Collections.sort(hand, new Card());
	}

	public int computeHandValue() {
		
		int distribution[] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		int bv[] = { 0,0,2,3,4,5,6,7,8,9,10,10,10,10,11,0};
		int aces = 0;
		int value=0;
//		int highValue = 0;
		
		for (int i=0; i< hand.size();i++) {
			if (hand.get(i).rank == 14) {
				aces++;
			}
		}

		for (int i=0; i< hand.size();i++) {
			distribution[hand.get(i).rank] += 1;
		}

		if (aces == 0) {
		    for (int i=0; i< 15;i++) {
		    	value += bv[i] * distribution[i];
		    }
		}
		else {
			int subtotal = 0;
		    for (int i=0; i< 15;i++) {
		    	if (i != 14) {
		    		subtotal += bv[i] * distribution[i];
		    	}
		    }
		    if (aces == 1) {
		    	value = subtotal + 11;
		    	if (value > 21) {
		    		value = subtotal + 1;	    	
		    	}
		    }
		}
//		System.out.print("[" + value + "]  ");
		return value;
	}
   
	// Overriding the compareTo method
    public int compareTo(BlackjackHand a){
       return (String.valueOf(this.value).compareTo(String.valueOf(a.value)));
    }

    // Overriding the compare method to sort the age 
    public int compare(BlackjackHand a, BlackjackHand  b){
       return 0;
    }

}
