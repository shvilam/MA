package com.ma.games.shureBore.command 
{
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.servise.MessageReceiver;
	import com.ma.games.shureBore.signal.controls.InitBordSignal;
	import com.ma.games.shureBore.view.ControlsView;
	import com.ma.games.shureBore.view.GameBordView;
	import com.ma.games.shureBore.view.ScoreView;
	import com.ma.games.shureBore.view.TimerView;
	import com.ma.games.shureBore.view.TurnView;
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
		
		[Inject]
		public var gv:GameValues;
		
		[Inject(name="Player.me")] 
		public var me:Player;
		
		[Inject(name="Player.his")] 
		public var his:Player;
		
		public function StartupCommand()
		{
			initBordSignal = new InitBordSignal();
		}
		
		override public function execute():void
		{
			gv.howsTurn = (me.playerIndex == 1)?me:his;
			var bord:GameBordView = new GameBordView();
			bord.x = 20;
			bord.y = 20;
			contextView.addChild(bord);
			
			var timer:TimerView = new TimerView();
			timer.x = 200;
			timer.y = 10;
			contextView.addChild(timer);
			
			var turnView:TurnView = new TurnView();
			turnView.x = 300;
			turnView.y = 10;
			contextView.addChild(turnView);
			
			var controlsView:ControlsView = new ControlsView();
			controlsView.x = 150;
			controlsView.y = 250;
			contextView.addChild(controlsView);
			
			
			var scoreView:ScoreView = new ScoreView();
			scoreView.x = 300;
			scoreView.y = 800;
			contextView.addChild(scoreView);
			
			trace("startUp");
			gameModel.init(5);
			messageReceiver.init();
			initBordSignal.dispatch(gameModel.gameBord.bord);
			
		}
		
	}

}