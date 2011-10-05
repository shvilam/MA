package com.ma.games.shureBore.model 
{
	import com.ma.games.shureBore.model.vo.Player;
	import org.robotlegs.mvcs.Actor;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class GameValues extends Actor
	{
		[Inject(name="Player.me")] 
		public var me:Player;
		
		public var howsTurn:Player;// will hold the player index
		
		public function isMyTurn():Boolean
		{
			return (howsTurn.playerIndex == me.playerIndex);
		}
		
		public function setTurn(player:Player):void
		{
			howsTurn = player;
		}
		
		public function GameValues() 
		{
			
		}
		
	}

}