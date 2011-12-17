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
		public GameBordModel gameModel;
		
		[Inject]
		public InitBordSignal initBordSignal;
		
		[Inject]
		public MessageReceiver messageReceiver;
		
		[Inject]
		public GameValues gv;
		
		[Inject(name="Player.me")] 
		public Player me;
		
		[Inject(name="Player.his")] 
		public Player his;
		
		public StartupCommand()
		{
			initBordSignal = new InitBordSignal();
		}
		
		 public void execute()
		{
			gv.howsTurn = (me.playerIndex == 1)?me:his;
			GameBordView bord = new GameBordView();
			bord.x = 20;
			bord.y = 20;
			contextView.addChild(bord);
			
			TimerView timer = new TimerView();
			timer.x = 200;
			timer.y = 10;
			contextView.addChild(timer);
			
			TurnView turnView = new TurnView();
			turnView.x = 300;
			turnView.y = 10;
			contextView.addChild(turnView);
			
			ControlsView controlsView = new ControlsView();
			controlsView.x = 150;
			controlsView.y = 250;
			contextView.addChild(controlsView);
			
			
			ScoreView scoreView = new ScoreView();
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
