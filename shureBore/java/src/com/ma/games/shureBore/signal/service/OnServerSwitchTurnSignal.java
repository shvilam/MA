package com.ma.games.shureBore.signal.service 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class OnServerSwitchTurnSignal extends Signal 
	{
		
		public OnServerSwitchTurnSignal() 
		{
			super(int) // the player index that send the message that mean that it the other user turn
		}
		
	}

}
