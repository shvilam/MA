package com.ma.games.shureBore.model 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class GameValues 
	{
		
		public var myPlayerIndex:uint;
		public var howsTurn:uint;// will hold the player index
		
		public function isMyTurn():Boolean
		{
			return (myPlayerIndex == howsTurn);
		}
		
		public function setTurn(playerIndex:uint):void
		{
			howsTurn = playerIndex;
		}
		
		public function GameValues() 
		{
			
		}
		
	}

}