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
		public MessageSender sender;
		
		[Inject]
		public GameValues gameValues;
		
		[Inject]
		public Player player;
		
		 public void execute() 
		{
			trace("player: " + player.playerIndex.toString());
			gameValues.setTurn(player);
			sender.switchTurns(player);
			//turnHasSwitchSignal.dispatch();
			
		}
		
	}

}
