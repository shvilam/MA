package com.ma.games.shureBore.servise 
{
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.model.vo.PPoint;
	import com.ma.games.shureBore.signal.service.OnServerAddLineSignal;
	import com.ma.games.shureBore.signal.service.OnServerFillBoreSignal;
	import com.ma.games.shureBore.signal.service.OnServerSwitchTurnSignal;
	import com.ma.games.shureBore.signal.service.OnServerTimeoutSignal;
	import org.robotlegs.mvcs.Actor;
	import flash.external.ExternalInterface;
	import com.adobe.serialization.json.JSON
	/**
	 * ...
	 * @author Shvilam
	 */
	public class MessageReceiver extends Actor
	{
		//[Inject]
		//public var connectionStatusSignal:ConnectionStatusSignal;
		[Inject]
		public var onServerFillBoreSignal:OnServerFillBoreSignal;
		[Inject]
		public var onServerAddLineSignal:OnServerAddLineSignal;
		//[Inject]
		//public var onServerUserDisconnectSignal:OnServerUserDisconnectSignal;
		[Inject]
		public var onServerTimeout:OnServerTimeoutSignal;
		
		[Inject]
		public var onServerSwitchTurn:OnServerSwitchTurnSignal;
		
		
		
		public function MessageReceiver() 
		{
			/*
			connectionStatusSignal = new ConnectionStatusSignal();
			onServerFillBoreSignal = new OnServerFillBoreSignal();
			onServerAddLineSignal = new OnServerAddLineSignal(); 
			onServerUserDisconnectSignal = new OnServerUserDisconnectSignal();
			onServerTimeout = new OnServerTimeoutSignal();
			onServerSwitchTurn = new OnServerSwitchTurnSignal();
			*/
			ExternalInterface.addCallback("onServer", onServer);
		}
		public function init():void
		{
			
		}
		
		private  function onServer(str:String):void
		{
			trace("onServer" + str);
			var obj:Object = JSON.decode(str,false);
			trace("decode");
			switch(obj.cmd)
			{
				case ServersCMD.ADD_LINE:
					onAddLine(obj);
					break;
				case ServersCMD.FILL_BORE:
					onFillBore(obj);
					break;
				case ServersCMD.SWITCH_TURN:
					onSwitchTurn(obj);
					break;
				case ServersCMD.ON_USER_DISCONNECT:
					onUserDisconnect(obj);
					break;
				case ServersCMD.TIME_UP:
					onTimeUp(obj);
					break;
			}
		}
		private function onSwitchTurn(obj:Object):void
		{
			onServerSwitchTurn.dispatch(parseInt(obj.playerIndex));
		}
		private function onTimeUp(obj:Object):void
		{
			
		}
		
		private function onUserDisconnect(obj:Object):void
		{
			//var playerIndex:User = obj.playerIndex;
			//onServerAddLineSignal.dispatch(line,obj.playerIndex);
		}
		
		private function onFillBore(obj:Object):void
		{
			var p:PPoint= PPoint.create(obj.point);
			//var playerIndex:User = obj.playerIndex;
			onServerFillBoreSignal.dispatch(obj.playerIndex,p);
		}
		private function onAddLine(obj:Object):void
		{
			var line:Line = Line.create(obj.line);
			//var playerIndex:User = obj.playerIndex;
			onServerAddLineSignal.dispatch(line,obj.playerIndex);
		}
		
		
	}

}