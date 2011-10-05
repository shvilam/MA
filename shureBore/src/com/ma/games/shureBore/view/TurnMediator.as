package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.signal.controls.TurnHasSwitchSignal;
	import com.ma.games.shureBore.signal.view.TurnSignal;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class TurnMediator extends Mediator
	{
		[Inject]
		public var turnHasSwitchSignal:TurnHasSwitchSignal;
		
		[Inject]
		public var view:TurnView;
		
		[Inject]
		public var gameValues:GameValues;
		
		public function TurnMediator() 
		{
			super();
			
		}
		public override function onRegister():void
		{
			turnHasSwitchSignal.add(onTurnChange);
			onTurnChange();
		}
		
		private function onTurnChange():void 
		{
			trace("gameValues.isMyTurn()" +  gameValues.isMyTurn());
			if (gameValues.isMyTurn())
			{
				view.setMyTurn();
			}
			else
			{
				view.setHisTurn();
			}
		}
		
	}

}