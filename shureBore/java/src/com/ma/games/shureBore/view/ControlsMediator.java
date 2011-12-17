package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.command.server.TurnHasSwitchCommand;
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.signal.controls.StopAlowFillBoreSignal;
	import com.ma.games.shureBore.signal.controls.TurnHasSwitchSignal;
	import com.ma.games.shureBore.signal.view.TurnSignal;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import org.osflash.signals.natives.NativeSignal;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class ControlsMediator extends Mediator 
	{
		[Inject]
		public StopAlowFillBoreSignal stopAlowFillBoreSignal;
		
		[Inject]
		public ControlsView view;
		
		[Inject]
		public GameValues gameValues;
		
		[Inject]
		public TurnSignal turnSignal;
		
		[Inject]
		public TurnHasSwitchSignal turnHasSwitchSignal;
		
		[Inject(name="Player.me")] 
		public Player me;
		
		[Inject(name="Player.his")] 
		public Player his;
		
		public ControlsMediator() 
		{
			super();
		}
		
		public void onRegister()
		{
			turnHasSwitchSignal.add(onTurnChange);
			stopAlowFillBoreSignal.add(onTurnChange);
			onTurnChange();
		}
		
		private void onTurnChange() 
		{
			if (gameValues.isMyTurn() && gameValues.isBoreFill)
			{
				view.turnClickSignal.addOnce(switchTurn); 
				trace("alloing change turn");
			}
			else
			{
				view.turnClickSignal.remove(switchTurn); 
				trace("disabling change turn");
			}
		}
		
		private void switchTurn(MouseEvent evt) 
		{
			turnSignal.dispatch(his);
			trace("send a request to change the turn");
		}
		
	}

}
