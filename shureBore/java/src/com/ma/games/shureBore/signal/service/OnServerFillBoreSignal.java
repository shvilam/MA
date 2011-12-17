package com.ma.games.shureBore.signal.service 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.PPoint
	/**
	 * ...
	 * @author Shvilam
	 */
	public class OnServerFillBoreSignal extends Signal 
	{
		
		public OnServerFillBoreSignal() 
		{
			super(int,PPoint)
		}
		
	}

}
