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
		public var stopAlowFillBoreSignal:StopAlowFillBoreSignal;
		
		[Inject]
		public var view:ControlsView;
		
		[Inject]
		public var gameValues:GameValues;
		
		[Inject]
		public var turnSignal:TurnSignal;
		
		[Inject]
		public var turnHasSwitchSignal:TurnHasSwitchSignal;
		
		[Inject(name="Player.me")] 
		public var me:Player;
		
		[Inject(name="Player.his")] 
		public var his:Player;
		
		public function ControlsMediator() 
		{
			super();
		}
		
		public override function onRegister():void
		{
			turnHasSwitchSignal.add(onTurnChange);
			stopAlowFillBoreSignal.add(onTurnChange);
			onTurnChange();
		}
		
		private function onTurnChange():void 
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
		
		private function switchTurn(evt:MouseEvent):void 
		{
			turnSignal.dispatch(his);
			trace("send a request to change the turn");
		}
		
	}

}