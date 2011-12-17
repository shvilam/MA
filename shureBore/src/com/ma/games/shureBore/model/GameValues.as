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
		
		public var howsTurn:Player;
		
		public var isBoreFill:Boolean;
		
		private var _myScore:int;
		private var _hisScore:int;
		
		public function isMyTurn():Boolean
		{
			return (howsTurn.playerIndex == me.playerIndex);
		}
		
		public function setTurn(player:Player):void
		{
			howsTurn = player;
		}
		
		public function addPintsToHis(numOfBore:int):void 
		{
			_hisScore = _hisScore + numOfBore;
		}
		
		public function addPintsToMe(numOfBore:int):void 
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