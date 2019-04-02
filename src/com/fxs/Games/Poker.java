/**
 * 
 */
package com.fxs.Games;

//import java.util.ArrayList;
//import java.util.Collections;
import java.util.LinkedList;

/**
 * @author FrankAdmin
 *
 */
public class Poker extends CardGame {
	
	public int cardsInHand = 5;
	public int playerCount = 7;
	public String version = "tbd";


	public PokerHand hand0 = new PokerHand();
	public PokerHand hand1 = new PokerHand();
	public PokerHand hand2 = new PokerHand();
	public PokerHand hand3 = new PokerHand();
	public PokerHand hand4 = new PokerHand();
	public PokerHand hand5 = new PokerHand();
	public PokerHand hand6 = new PokerHand();

	public PokerHand[] hands = new PokerHand[7];
	
	
	public Poker() {
		
		//System.out.println("Interface version");
		setVersion("1.7");

		setPlayerName(0, "Frank");
		setPlayerName(1, "Dianne");
		setPlayerName(2, "Pete");
		setPlayerName(3, "Dave");
		setPlayerName(4, "Jim");
		setPlayerName(5, "Becca");
		setPlayerName(6, "Emily");

		hands[0] = hand0;
		hands[1] = hand1;
		hands[2] = hand2;
		hands[3] = hand3;
		hands[4] = hand4;
		hands[5] = hand5;
		hands[6] = hand6;
		
		for(int i=0;i<7;i++) {
			hands[i].setPlayerName(getPlayerName(i));
		}
		
	}
	
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public void play() {	
	
	
		deal();
		
		for (int i=0;i<getPlayerCount();i++) {
			//System.out.println("______________");
			hands[i].setPlayerName(getPlayerName(i));
			System.out.print(hands[i].getPlayerName() + " ");
			System.out.print("[" + hands[i].value + "]  ");
			hands[i].display();
		}
	
//		while (!queue.isEmpty()) {
//			System.out.println(queue.pop().display());
//		}
		
		
		
	}
	/*
	void createDeck() {

		String suits[] = { "clubs", "diamonds","hearts","spades"};
		for(int s=0;s<4;s++) {
			
			for(int i=2;i<=14;i++) {
				Card card = new Card(i,suits[s]);
				deck.add(card);
			}
		}
		
	}
	*/

/*
	public void shuffle() {	
		for (int i=0;i<25;i++) {
			Collections.shuffle(deck);
		}
	}
*/	
	public void deal() {
		LinkedList<Card> queue = new LinkedList<Card>(deck);
		for (int x=0;x<cardsInHand;x++) {
			for (int i=0;i<getPlayerCount();i++) {
				int handIndex = (i + getPlayerCount()) % getPlayerCount();
				//System.out.println("handindex=" + handIndex + " x=" + x);
				hands[handIndex].add(x,queue.pop());
			}
		}
		for (int i=0;i<getPlayerCount();i++) {
			//System.out.println("______________");
			hands[i].sort();
			hands[i].computeHandValue();
			hands[i].setPlayerName(getPlayerName(i));
		}

	}
	
	public PokerHand getHand(int i) {
		return(hands[i]);
	}

	public int getCardsInHand() {
		return cardsInHand;
	}

	public void setCardsInHand(int cardsInHand) {
		this.cardsInHand = cardsInHand;
	}

	public int getPlayerCount() {
		return playerCount;
	}

	public void setPlayerCount(int players) {
		this.playerCount = players;
	}
/*
	public String getPlayerName(int seat) {
		
		return playerName[seat];
	}

	public void setPlayerName(int seat, String playerName) {
		this.playerName[seat] = playerName;
	}
*/

}
