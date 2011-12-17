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
		private int arrayIndex;// player Index
		private Vector players.<Player>;
		
		
		public TurnModel() 
		{
			players = new Vector.<Player>();
		}
		
		
		public Player switchTurn() 
		{
			players [arrayIndex].numOfTurns = players [arrayIndex].numOfTurns + 1;
			howsTurn = howsTurn + 1;
			return players[howsTurn];
		}
		
		private void onPlayerDisconect(int id)
		{
			removePlayerById()
		}
		
		private Player removePlayerById(int id)
		{
			for (int i = 0; i <players.length ; i++) 
			{
				if (players[i].id == id)
				{
					
					ArrayUtil.removeValueFromArray(players, players[i]
				}
			}
		}
	}

}
