package com.fxs.Games;
/**
 * 
 */


//import ArrayList;
//import java.util.Collections;
import java.util.LinkedList;

/**
 * @author FrankAdmin
 *
 */
public class Blackjack extends CardGame {
	
	public int cardsInHand = 6;
	public int playerCount = 7;
	public String version = "tbd";
	public String dealer = "Dealer";

	
	

	public BlackjackHand hand0 = new BlackjackHand();
	public BlackjackHand hand1 = new BlackjackHand();
	public BlackjackHand hand2 = new BlackjackHand();
	public BlackjackHand hand3 = new BlackjackHand();
	public BlackjackHand hand4 = new BlackjackHand();
	public BlackjackHand hand5 = new BlackjackHand();
	public BlackjackHand hand6 = new BlackjackHand();
	public BlackjackHand hand7 = new BlackjackHand();

	public BlackjackHand[] hands = new BlackjackHand[8];
	
	
	public static void main() {
		
		Blackjack game = new Blackjack(5);
		long seed = System.currentTimeMillis() % 100;
		for (long t=0;t<seed;t++) {
			game.shuffle();
		}

	}
	
	public Blackjack(int playerCount) {
		
		//System.out.println("Interface version");
		setVersion("1.9");
		setPlayerName(0, "Frank");
		setPlayerName(1, "Dianne");
		setPlayerName(2, "Pete");
		setPlayerName(3, "David");
		setPlayerName(4, "Jim");
		setPlayerName(5, "Becca");
		setPlayerName(6, "Sam");
		
		hands[0] = hand0;
		hands[1] = hand1;
		hands[2] = hand2;
		hands[3] = hand3;
		hands[4] = hand4;
		hands[5] = hand5;
		hands[6] = hand6;
		hands[7] = hand7;

		setPlayerCount(playerCount);

		setPlayerName(getPlayerCount(),dealer);		
		
		setPlayerCount(playerCount + 1);

		
	}
	
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public LinkedList<Card> getDeck() {
		return queue;
	}

	public void play() {	
	

		deal();
		
		
		
		
		for (int i=0;i<getPlayerCount();i++) {
			//System.out.println("______________");
			hands[i].setPlayerName(getPlayerName(i));
//			System.out.print(hands[i].getPlayerName() + " ");
//			System.out.print("[" + hands[i].value + "]  ");
			hands[i].display();
		}
	
//		while (!queue.isEmpty()) {
//			System.out.println(queue.pop().display());
//		}
		
		
		
	}

	public void deal() {
//		System.out.println("In deal() - Deal the cards");
		for (int x=0;x<2;x++) {
			for (int i=0;i<getPlayerCount();i++) {
				if (hands[i].computeHandValue() <= 16) {
					int handIndex = (i + getPlayerCount()) % getPlayerCount();
//					System.out.println("handindex=" + handIndex + " x=" + x);
					hands[handIndex].add(x,queue.pop());
				}
			}
		}
		for (int i=0;i<getPlayerCount();i++) {
			//System.out.println("______________");
			hands[i].sort();
			hands[i].computeHandValue();
			hands[i].setPlayerName(getPlayerName(i));
		}

	}
	
	public BlackjackHand getHand(int i) {
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


}
