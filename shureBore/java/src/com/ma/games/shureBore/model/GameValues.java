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
		public Player me;
		
		public Player howsTurn;
		
		public boolean isBoreFill;
		
		private int _myScore;
		private int _hisScore;
		
		public boolean isMyTurn()
		{
			return (howsTurn.playerIndex == me.playerIndex);
		}
		
		public void setTurn(Player player)
		{
			howsTurn = player;
		}
		
		public void addPintsToHis(int numOfBore) 
		{
			_hisScore = _hisScore + numOfBore;
		}
		
		public void addPintsToMe(int numOfBore) 
		{
			_myScore = _myScore + numOfBore;
		}
		
		public function get myScore():int 
		{
			return _myScore;
		}
		
		public function get hisScore():int 
		{
			return _hisScore;
		}
		
		
	}

}
