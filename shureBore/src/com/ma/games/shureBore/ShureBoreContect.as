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
		public var startupSignal:StartupSignal;
		public function ShureBoreContect(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		override public function startup():void
		{
			var params:Object = contextView.root.loaderInfo.parameters;
			
			var me:Player = new Player();
			me.playerIndex = params.mePlayerIndex;
			me.userId = params.meUserId;
			
			var his:Player = new Player();
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
			injector.mapSingleton(TimeEndedSignal);
			injector.mapSingleton(StopAlowFillBore);
			
			injector.mapSingletonOf(IMessageBus, ExternalBus);
			
			
			startupSignal = StartupSignal(signalCommandMap.mapSignalClass(StartupSignal, StartupCommand));
			// view
			signalCommandMap.mapSignalClass(OnBoreClickedSignal, BoreClickCommand);
			// conmmand
			signalCommandMap.mapSignalClass(TryToFillBoreSignal, BoreClickCommand);
			
			signalCommandMap.mapSignalClass(OnServerFillBoreSignal,FillBoreCommand);
			signalCommandMap.mapSignalClass(OnServerAddLineSignal, AddLineBoreCommand);
			signalCommandMap.mapSignalClass(OnServerTimeoutSignal, TimeOutCommand);
			signalCommandMap.mapSignalClass(TurnSignal, SwitchTurnCommand);
			signalCommandMap.mapSignalClass(OnServerSwitchTurnSignal, TurnHasSwitchCommand);
			
			
			
			
			mediatorMap.mapView(GameBordView, GameBordMediator);
			mediatorMap.mapView(TurnView, TurnMediator);
			mediatorMap.mapView(ControlsView, ControlsMediator);
			mediatorMap.mapView(TimerView, TimerMediator);
			
			
			
			startupSignal.dispatch();
			
			
			
			

		}
		
	}

}