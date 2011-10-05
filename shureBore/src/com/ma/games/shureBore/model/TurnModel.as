package com.ma.games.shureBore.model 
{
	import com.adobe.utils.ArrayUtil;
	import com.adobe.utils.Messenger;
	import com.ma.games.shureBore.model.vo.Player;
	import org.robotlegs.mvcs.Actor;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class TurnModel extends Actor 
	{
		private var arrayIndex:int;// player Index
		private var players:Vector.<Player>;
		
		
		public function TurnModel() 
		{
			players = new Vector.<Player>();
		}
		
		
		public function switchTurn():Player 
		{
			players [arrayIndex].numOfTurns = players [arrayIndex].numOfTurns + 1;
			howsTurn = howsTurn + 1;
			return players[howsTurn];
		}
		
		private function onPlayerDisconect(id:int):void
		{
			removePlayerById()
		}
		
		private function removePlayerById(id:int):Player
		{
			for (var i:int = 0; i <players.length ; i++) 
			{
				if (players[i].id == id)
				{
					
					ArrayUtil.removeValueFromArray(players, players[i]
				}
			}
		}
	}

}