package com.ma.games.shureBore.signal.service 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class OnServerUserDisconnectSignal extends Signal 
	{
		
		public function OnServerUserDisconnectSignal() 
		{
			super(int)// player index that mean that the other user not me has disconnected
		}
		
	}

}