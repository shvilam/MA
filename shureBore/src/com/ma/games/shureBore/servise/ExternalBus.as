package com.ma.games.shureBore.servise 
{
	import flash.external.ExternalInterface;
	/**
	 * use the java script to emulated a server 
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