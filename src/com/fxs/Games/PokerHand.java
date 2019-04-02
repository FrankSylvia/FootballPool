package com.fxs.Games;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class PokerHand implements Comparator<PokerHand>, Comparable<PokerHand>  {
	
	public static final int FOUR_OF_A_KIND_VALUE    = 10000000;
	public static final int FULL_HOUSE_VALUE		= 5000000;
	public static final int FLUSH_VALUE    			= 100000;
	public static final int STRAIGHT_VALUE 			= 50000;
	public static final int THREE_OF_A_KIND_VALUE   = 10000;
	public static final int PAIR_VALUE   			= 1000;
	
	public int value;
	public String playerName;
	
	
	public ArrayList<Card> hand = new ArrayList<Card>();
	
	

	public PokerHand() {
		
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
			t = new Card(hand.get(0));
		return t;
	}

	public void display() {
		for (int x=0;x<hand.size();x++) {
			System.out.print(hand.get(x).display() + " ");
		}
		System.out.println(" ");
	}
	
	public void sort() {
		Collections.sort(hand, new Card());
	}

	public void computeHandValue() {
		
		int distribution[] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		
		for (int i=0; i< 5;i++) {
			distribution[hand.get(i).rank] += 1;
		}
		
		// Check for 4 of a king
		for (int d=0;d<15;d++) {
			if (distribution[d] == 4) {
				value = FOUR_OF_A_KIND_VALUE + d;
				break;
			}
		}
		
		// Check for full house or three of a kind
		if (value == 0) {
			for (int x=0;x<15;x++) {
				if (distribution[x] == 3) {
					for (int y=0;y<15;y++) {
						if (distribution[y] == 2) {	
							value = FULL_HOUSE_VALUE + x;  // Full House
							break;
						}
					}
					if (value == 0) {
						value = THREE_OF_A_KIND_VALUE + x;  // Three of a kind
					}
				}
			}
		}
		if (value == 0) {
			int firstPairValue=0;
			int secondPairValue=0;
			for (int z=0;z<15;z++) {
				if (distribution[z] == 2) {
					if (value == 0) {
					    firstPairValue = z;
					    value = PAIR_VALUE;
					}
					else {
						secondPairValue = z;
						value += PAIR_VALUE;
					}
				}
			}
			if (firstPairValue > 0) {
				if (secondPairValue > 0) {
					if (secondPairValue > firstPairValue) {
						value += secondPairValue;
					}	
					else {
						value += firstPairValue;
					}
				}
				else {
					value = PAIR_VALUE + firstPairValue;					
				}
			}
		}
		
		if (value == 0) {
			value = value + isFlush();
			value = value + isStraight();
		}
	
		if (value == 0) {
			int weight = 1;
			for (int z=0;z<15;z++) {
				//System.out.println(z + "=" + distribution[z]);
				if (distribution[z] == 1) {	
					value = value + (z * weight++);
				}
			}
		}
		
		//System.out.print("[" + value + "]  ");
	}
   
	// Overriding the compareTo method
    public int compareTo(PokerHand a){
       return (String.valueOf(this.value).compareTo(String.valueOf(a.value)));
    }

    // Overriding the compare method to sort the age 
    public int compare(PokerHand a, PokerHand  b){
       return 0;
    }
   
   
   
    public int isFlush() {
	   
	   String testSuit = hand.get(0).getSuit();
	   
	   //System.out.println("testSuit=" + testSuit);
	   for (int i=1;i<5;i++) {
		   if (!hand.get(i).getSuit().equals(testSuit)) {
			   return(0);
		   }
	   }
	   return FLUSH_VALUE;
   }

    
    public int isStraight() {
	   
	   int result = 0;
	   if ((hand.get(0).getRank() == 2) && (hand.get(1).getRank() == 3) && (hand.get(2).getRank() == 4) && (hand.get(3).getRank() == 5) && (hand.get(4).getRank() == 14)) {
		   result = STRAIGHT_VALUE;
	   }
	   else {
		   for (int i=1;i<5;i++) {
			   if (hand.get(i-1).getRank() != (hand.get(i).getRank() - 1)) {
				   result = 0;
				   break;
			   }
			   else {
				   result = STRAIGHT_VALUE;
			   }
		   }
	   }
	   if (result == STRAIGHT_VALUE)
		   result = result + hand.get(4).getRank();
	   return result;
   	}

}
