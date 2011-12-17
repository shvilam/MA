package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.signal.controls.StopAlowFillBoreSignal;
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
		public TurnHasSwitchSignal turnHasSwitchSignal;
		
		[Inject]
		public TurnView view;
		
		[Inject]
		public GameValues gameValues;
		
		public TurnMediator() 
		{
			super();
			
		}
		public void onRegister()
		{
			turnHasSwitchSignal.add(onTurnChange);
			onTurnChange();
		}
		
		private void onTurnChange() 
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
