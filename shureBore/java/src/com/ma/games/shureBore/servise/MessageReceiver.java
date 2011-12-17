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
		//public ConnectionStatusSignal connectionStatusSignal;
		[Inject]
		public OnServerFillBoreSignal onServerFillBoreSignal;
		[Inject]
		public OnServerAddLineSignal onServerAddLineSignal;
		//[Inject]
		//public OnServerUserDisconnectSignal onServerUserDisconnectSignal;
		//[Inject]
		//public OnServerTimeoutSignal onServerTimeout;
		
		[Inject]
		public OnServerSwitchTurnSignal onServerSwitchTurn;
		
		
		
		public MessageReceiver() 
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
		public void init()
		{
			
		}
		
		private void onServer(String str)
		{
			trace("onServer" + str);
			Object obj = JSON.decode(str,false);
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
		private void onSwitchTurn(Object obj)
		{
			onServerSwitchTurn.dispatch(parseInt(obj.playerIndex));
		}
		private void onTimeUp(Object obj)
		{
			
		}
		
		private void onUserDisconnect(Object obj)
		{
			//User playerIndex = obj.playerIndex;
			//onServerAddLineSignal.dispatch(line,obj.playerIndex);
		}
		
		private void onFillBore(Object obj)
		{
			PPoint p= PPoint.create(obj.point);
			//User playerIndex = obj.playerIndex;
			onServerFillBoreSignal.dispatch(obj.playerIndex,p);
		}
		private void onAddLine(Object obj)
		{
			Line line = Line.create(obj.line);
			//User playerIndex = obj.playerIndex;
			onServerAddLineSignal.dispatch(line,obj.playerIndex);
		}
		
		
	}

}
