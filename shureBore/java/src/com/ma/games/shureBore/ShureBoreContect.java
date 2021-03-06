package com.ma.games.shureBore 
{
	
	import com.ma.games.shureBore.command.*;
	import com.ma.games.shureBore.command.server.*;
	import com.ma.games.shureBore.model.*;
	import com.ma.games.shureBore.model.vo.*;
	import com.ma.games.shureBore.servise.*;
	import com.ma.games.shureBore.signal.controls.*;
	import com.ma.games.shureBore.signal.service.*;
	import com.ma.games.shureBore.signal.view.*;
	import com.ma.games.shureBore.signal.*;
	import com.ma.games.shureBore.view.*;
	import flash.display.*;
	import org.robotlegs.mvcs.*;
	
	
	
	
	
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class ShureBoreContect  extends SignalContext	{
		public StartupSignal startupSignal;
		public ShureBoreContect(DisplayObjectContainer contextView=null,boolean autoStartup=true)
		{
			super(contextView, autoStartup);
		}
		 public void startup()
		{
			Object params = contextView.root.loaderInfo.parameters;
			
			Player me = new Player();
			me.playerIndex = params.mePlayerIndex;
			me.userId = params.meUserId;
			
			Player his = new Player();
			his.playerIndex = params.hisPlayerIndex;
			his.userId = params.hisUserId;
			
			injector.mapValue(Player, me, "Player.me");
			injector.mapValue(Player, his, "Player.his");
			
			
			injector.mapSingleton(GameValues);
			
			injector.mapSingleton(GameBordModel);
			injector.mapSingleton(MessageReceiver);
			injector.mapSingleton(MessageSender);
			injector.mapSingleton(InitBordSignal);
			injector.mapSingleton(BoreHasUpdatedSignal);
			injector.mapSingleton(TurnHasSwitchSignal);
			injector.mapSingleton(ScoreHasUpdateSignal);
			injector.mapSingleton(LineHasAddedSignal);
			injector.mapSingleton(TimeEndedSignal);
			injector.mapSingleton(StopAlowFillBoreSignal);
			
			injector.mapSingletonOf(IMessageBus, ExternalBus);
			
			
			startupSignal = StartupSignal(signalCommandMap.mapSignalClass(StartupSignal, StartupCommand));
			// view
			signalCommandMap.mapSignalClass(OnBoreClickedSignal, BoreClickCommand);
			signalCommandMap.mapSignalClass(TimeEndedSignal, MyTimeHasOutCommand);
			
			// conmmand
			signalCommandMap.mapSignalClass(TryToFillBoreSignal, BoreClickCommand);
			signalCommandMap.mapSignalClass(TryDrawLineSignal, LineDrawCommand);
			// Server
			signalCommandMap.mapSignalClass(OnServerFillBoreSignal,FillBoreCommand);
			signalCommandMap.mapSignalClass(OnServerAddLineSignal, AddLineCommand);
			
			signalCommandMap.mapSignalClass(TurnSignal, SwitchTurnCommand);
			signalCommandMap.mapSignalClass(OnServerSwitchTurnSignal, TurnHasSwitchCommand);
			
			
			mediatorMap.mapView(GameBordView, GameBordMediator);
			mediatorMap.mapView(TurnView, TurnMediator);
			mediatorMap.mapView(ControlsView, ControlsMediator);
			mediatorMap.mapView(TimerView, TimerMediator);
			mediatorMap.mapView(ScoreView, ScoreMediator);
			
			startupSignal.dispatch();
		}
		
	}

}
