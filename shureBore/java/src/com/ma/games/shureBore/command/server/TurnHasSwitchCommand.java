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
		public TurnHasSwitchSignal turnHasSwitchSignal;
		
		[Inject]
		public int playerIndex;
		
		[Inject]
		public GameValues gameValues;
		
		[Inject(name="Player.me")] 
		public Player me;
		
		[Inject(name="Player.his")] 
		public Player his;
		
		 public void execute() 
		{
			trace("server ask to switch turn me.playerIndex: " + me.playerIndex + "playerIndex: " + playerIndex);
			Player player = (playerIndex == me.playerIndex)?me:his;
			gameValues.setTurn(player);
			gameValues.isBoreFill = false;
			turnHasSwitchSignal.dispatch();
		}
		
	}

}
