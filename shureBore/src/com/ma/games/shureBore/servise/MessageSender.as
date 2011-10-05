package com.ma.games.shureBore.servise 
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Bord;
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.model.vo.PPoint;
	import org.robotlegs.mvcs.Actor;
	import com.adobe.serialization.json.JSON;
	import com.adobe.serialization.json.JSONParseError
	/**
	 * ...
	 * @author Shvilam
	 */
	public class MessageSender extends Actor 
	{
		[Inject]
		public var messageBus:IMessageBus;
		
		[Inject]
		public var gamesValues:GameValues;
		
		public function MessageSender() 
		{
			
		}
		
		public function fillBore(p:PPoint):void
		{
			var obj:Object = new Object();
			obj.point = p.toObj();
			obj.playerIndex = 1;
			obj.cmd = ServersCMD.FILL_BORE;
			messageBus.send(JSON.encode(obj));
		}
		
		public function addLineBore(line:Line):void
		{
			var obj:Object = new Object();
			obj.line = line.toObj();
			obj.playerIndex = 1;
			obj.cmd = ServersCMD.ADD_LINE;
			messageBus.send(JSON.encode(obj));
		}
		
		public function timeOut():void
		{
			var obj:Object = new Object();
			obj.playerIndex = 1;
			obj.cmd = ServersCMD.TIME_UP;
			messageBus.send(JSON.encode(obj));
		}
		
		public function switchTurns(player:Player):void
		{
			var obj:Object = new Object();
			obj.playerIndex = player.playerIndex;
			obj.cmd = ServersCMD.SWITCH_TURN;
			messageBus.send(JSON.encode(obj));
		}
		
		public function gameOver():void
		{
			
		}
		public function iReady():void
		{
			
		}
		
		
		
	}

}