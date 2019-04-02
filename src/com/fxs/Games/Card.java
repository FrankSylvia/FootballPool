/**
 * 
 */
package com.fxs.Games;

import java.util.Comparator;

/**
 * @author FrankAdmin
 *
 */
public class Card implements Comparator<Card>, Comparable<Card> {
	
	String suit;
	int rank;
	String displayValue;
	String imageName;
	
	public Card() {
		setSuit("X");
		setRank(0);
		setDisplayValue("0");
		
	}
	
	public Card(Card c) {
		setSuit(c.suit);
		setRank(c.rank);
		setDisplayValue(c.displayValue);
		setImageName(suit,rank);
	}
	
	public Card(int rank, String suit) {
		this.suit = suit;
		this.rank = rank;
		switch (rank) {
		case 11:
			displayValue = "J";
		    break;
		case 12:
			displayValue = "Q";
		    break;
		case 13:
			displayValue = "K";
		    break;
		case 14 :
			displayValue = "A";
			break;
		default:
			displayValue = String.valueOf(rank);
		}
		setImageName(suit,rank);
		
	} 
	

	
	public String getSuit() {
		return suit;
	}
	public void setSuit(String suit) {
		this.suit = suit;
	}

	public String getSuitSymbol() {
		String symbol = "";
		if (getSuit().equalsIgnoreCase("spades")) {
			symbol = "&#9824;";
		}			
		else if (getSuit().equalsIgnoreCase("hearts")) {
			symbol = "&#9825;";
		}
		else if (getSuit().equalsIgnoreCase("diamonds")) {
			symbol = "&#9826;";
		}
		else if (getSuit().equalsIgnoreCase("clubs")) {
			symbol = "&#9827;";
		}
		return symbol;
	}

	public String getSuitColor() {
		String color = "";
		if (getSuit().equalsIgnoreCase("hearts")) {
			color = "red";
		}			
		else if (getSuit().equalsIgnoreCase("spades")) {
			color = "black";
		}
		else if (getSuit().equalsIgnoreCase("clubs")) {
			color = "black";
		}
		else if (getSuit().equalsIgnoreCase("diamonds")) {
			color = "red";
		}
		return color;
	}
	
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getDisplayValue() {
		return displayValue;
	}
	public void setDisplayValue(String displayValue) {
		this.displayValue = displayValue;
	}
	
	public String display() {
		return (this.displayValue + " " + this.suit);
	}

	public String toString() {
		return (this.displayValue + " " + this.rank + " " + this.suit);
	}
	
   // Overriding the compareTo method
   public int compareTo(Card a){
      return (String.valueOf(this.rank).compareTo(String.valueOf(a.rank)));
   }

   // Overriding the compare method to sort the age 
   public int compare(Card a, Card  b){
      return a.rank - b.rank;
   }

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
	public void setImageName(String suit, int rank) {
		
		switch (rank) {
		case 10:
			this.imageName = "t";
		    break;
		case 11:
			this.imageName = "j";
		    break;
		case 12:
			this.imageName = "q";
		    break;
		case 13:
			this.imageName = "k";
		    break;
		case 14 :
			this.imageName = "a";
			break;
		default:
			this.imageName = String.valueOf(rank);
		}

		String symbol = "";
		if (getSuit().equalsIgnoreCase("spades")) {
			symbol = "s";
		}			
		else if (getSuit().equalsIgnoreCase("hearts")) {
			symbol = "h";
		}
		else if (getSuit().equalsIgnoreCase("diamonds")) {
			symbol = "d";
		}
		else if (getSuit().equalsIgnoreCase("clubs")) {
			symbol = "c";
		}

		
		this.imageName = imageName + symbol;
//		System.out.println(this.imageName);
	}

	
}
