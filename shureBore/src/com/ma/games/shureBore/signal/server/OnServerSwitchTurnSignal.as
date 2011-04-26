package com.ma.games.shureBore.signal.server 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class OnServerSwitchTurnSignal extends Signal 
	{
		
		public function OnServerSwitchTurnSignal() 
		{
			super(int) // the player index that send the message that mean that it the other user turn
		}
		
	}

}