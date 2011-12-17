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
		public IMessageBus messageBus;
		
		[Inject]
		public GameValues gamesValues;
		
		public MessageSender() 
		{
			
		}
		
		public void fillBore(PPoint p)
		{
			Object obj = new Object();
			obj.point = p.toObj();
			obj.playerIndex = 1;
			obj.cmd = ServersCMD.FILL_BORE;
			messageBus.send(JSON.encode(obj));
		}
		
		public void addLineBore(Line line)
		{
			Object obj = new Object();
			obj.line = line.toObj();
			obj.playerIndex = 1;
			obj.cmd = ServersCMD.ADD_LINE;
			messageBus.send(JSON.encode(obj));
		}
		
		public void timeOut()
		{
			Object obj = new Object();
			obj.playerIndex = 1;
			obj.cmd = ServersCMD.TIME_UP;
			messageBus.send(JSON.encode(obj));
		}
		
		public void switchTurns(Player player)
		{
			Object obj = new Object();
			obj.playerIndex = player.playerIndex;
			obj.cmd = ServersCMD.SWITCH_TURN;
			messageBus.send(JSON.encode(obj));
		}
		
		public void gameOver()
		{
			
		}
		public void iReady()
		{
			
		}
		
		
		
	}

}
