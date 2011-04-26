package com.ma.games.shureBore.signal.server 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class OnServerTimeoutSignal extends Signal 
	{
		
		public function OnServerTimeoutSignal() 
		{
			super(int)//player index that got the time out this is meand that the trun will move to the other player 
		}
		
	}

}