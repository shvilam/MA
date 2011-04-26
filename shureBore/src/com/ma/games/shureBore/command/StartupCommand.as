package com.ma.games.shureBore.command 
{
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.servise.MessageReceiver;
	import com.ma.games.shureBore.signal.InitBordSignal;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class StartupCommand extends SignalCommand 
	{
		[Inject]
		public var gameModel:GameBordModel;
		
		[Inject]
		public var initBordSignal:InitBordSignal;
		
		[Inject]
		public var messageReceiver:MessageReceiver;
		
		public function StartupCommand()
		{
			initBordSignal = new InitBordSignal();
		}
		
		override public function execute():void
		{
			trace("startUp");
			gameModel.init(5);
			messageReceiver.init();
			initBordSignal.dispatch(gameModel.gameBord.bord);
		}
		
	}

}