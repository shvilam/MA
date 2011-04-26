package com.ma.games.shureBore 
{
	
	import com.ma.games.shureBore.signal.*;
	import com.ma.games.shureBore.model.*;
	import com.ma.games.shureBore.servise.*;
	import com.ma.games.shureBore.command.*;
	import com.ma.games.shureBore.view.*;
	import flash.display.DisplayObjectContainer;
	
	import  com.ma.games.shureBore.signal.OnBoreClickedSignal
	import  com.ma.games.shureBore.signal.server.OnServerFillBoreSignal;
	import  com.ma.games.shureBore.signal.server.OnServerAddLineSignal;
	import  com.ma.games.shureBore.signal.server.OnServerTimeoutSignal;
	import  com.ma.games.shureBore.signal.server.OnServerUserDisconnectSignal;
	import  com.ma.games.shureBore.signal.server.OnServerSwitchTurnSignal;
	
	
	
	import flash.display.DisplayObject;
	import org.robotlegs.mvcs.SignalContext;
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
			var g:GameValues  = new GameValues();
			g.myPlayerIndex = parseInt(contextView.root.loaderInfo.parameters.player);
			injector.mapValue(GameValues, g);
			injector.mapSingleton(GameBordModel);
			injector.mapSingleton(MessageReceiver);
			injector.mapSingleton(MessageSender);
			injector.mapSingleton(InitBordSignal);
			injector.mapSingleton(UpdateBoreSignal);
			//injector.mapSingleton(GameValues);
			injector.mapSingletonOf(IMessageBus, ExternalBus);
			
			
			startupSignal = StartupSignal(signalCommandMap.mapSignalClass(StartupSignal, StartupCommand));
			// view
			signalCommandMap.mapSignalClass(OnBoreClickedSignal, BoreClickCommand);
			// conmmand
			signalCommandMap.mapSignalClass(TryToFillBoreSignal, BoreClickCommand);
			
			signalCommandMap.mapSignalClass(OnServerFillBoreSignal, FillBoreCommand);
			signalCommandMap.mapSignalClass(OnServerAddLineSignal, AddLineBoreCommand);
			signalCommandMap.mapSignalClass(OnServerTimeoutSignal, TimeOutCommand);
			signalCommandMap.mapSignalClass(OnServerSwitchTurnSignal, SwitchTurnCommand);
			
			
			
			
			mediatorMap.mapView(BordView, GameBordMediator);
			
			var bord:BordView = new BordView();
			bord.x = 200;
			bord.y = 200;
			contextView.addChild(bord);
			startupSignal.dispatch();
			
			
			
			

		}
		
	}

}