package com.ma.games.shureBore.command.server 
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.signal.controls.TurnHasSwitchSignal;
	import com.ma.games.shureBore.signal.view.TurnSignal;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author ...
	 */
	public class TurnHasSwitchCommand extends SignalCommand 
	{
		[Inject]
		public var turnHasSwitchSignal:TurnHasSwitchSignal;
		
		[Inject]
		public var playerIndex:int;
		
		[Inject]
		public var gameValues:GameValues;
		
		[Inject(name="Player.me")] 
		public var me:Player;
		
		[Inject(name="Player.his")] 
		public var his:Player;
		
		override public function execute():void 
		{
			trace("server ask to switch turn me.playerIndex: " + me.playerIndex + "playerIndex: " + playerIndex);
			var player:Player = (playerIndex == me.playerIndex)?me:his;
			gameValues.setTurn(player);
			gameValues.isBoreFill = false;
			turnHasSwitchSignal.dispatch();
		}
		
	}

}