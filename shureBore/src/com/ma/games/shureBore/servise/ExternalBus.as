package com.ma.games.shureBore.servise 
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class ExternalBus implements IMessageBus
	{
		
		public function ExternalBus() 
		{
			
		}
		
		public function send(str:String):void
		{
			ExternalInterface.call("send", str);
			trace("send " + str);
		}
		
		
	}

}