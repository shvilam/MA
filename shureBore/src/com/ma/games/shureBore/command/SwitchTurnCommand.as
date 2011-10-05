package com.ma.games.shureBore.command 
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.servise.MessageSender;
	import com.ma.games.shureBore.signal.controls.TurnHasSwitchSignal;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class SwitchTurnCommand extends SignalCommand
	{
		[Inject]
		public var turnHasSwitchSignal:TurnHasSwitchSignal;
		
		[Inject]
		public var sender:MessageSender;
		
		[Inject]
		public var gameValues:GameValues;
		
		[Inject]
		public var player:Player;
		
		override public function execute():void 
		{
			trace("player: " + player.playerIndex.toString());
			gameValues.setTurn(player);
			sender.switchTurns(player);
			//turnHasSwitchSignal.dispatch();
			
		}
		
	}

}