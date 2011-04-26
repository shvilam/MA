package com.ma.games.shureBore.servise 
{
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.model.vo.Point;
	import com.ma.games.shureBore.signal.ConnectionStatusSignal;
	import com.ma.games.shureBore.signal.server.*;
	import com.ma.games.shureBore.signal.TryToFillBoreSignal;
	import org.robotlegs.mvcs.Actor;
	import flash.external.ExternalInterface;
	import com.adobe.serialization.json.JSON
	/**
	 * ...
	 * @author Shvilam
	 */
	public class MessageReceiver extends Actor
	{
		
		public var connectionStatusSignal:ConnectionStatusSignal;
		public var onServerFillBoreSignal:OnServerFillBoreSignal;
		public var onServerAddLineSignal:OnServerAddLineSignal;
		public var onServerUserDisconnectSignal:OnServerUserDisconnectSignal;
		public var onServerTimeout:OnServerTimeoutSignal;
		public var onServerSwitchTurn:OnServerSwitchTurnSignal;
		
		public function MessageReceiver() 
		{
			connectionStatusSignal = new ConnectionStatusSignal();
			onServerFillBoreSignal = new OnServerFillBoreSignal();
			onServerAddLineSignal = new OnServerAddLineSignal(); 
			onServerUserDisconnectSignal = new OnServerUserDisconnectSignal();
			onServerTimeout = new OnServerTimeoutSignal();
			onServerSwitchTurn = new OnServerSwitchTurnSignal();
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
			var p:Point= Point.create(obj.point);
			//var playerIndex:User = obj.playerIndex;
			onServerFillBoreSignal.dispatch(p,obj.playerIndex);
		}
		private function onAddLine(obj:Object):void
		{
			var line:Line = Line.create(obj.line);
			//var playerIndex:User = obj.playerIndex;
			onServerAddLineSignal.dispatch(line,obj.playerIndex);
		}
		
		
	}

}