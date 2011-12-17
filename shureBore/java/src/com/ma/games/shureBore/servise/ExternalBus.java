package com.ma.games.shureBore.servise 
{
	import flash.external.ExternalInterface;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class ExternalBus implements IMessageBus
	{
		
		public ExternalBus() 
		{
			
		}
		
		public void send(String str)
		{
			ExternalInterface.call("send", str);
			trace("send " + str);
		}
		
		
	}

}
