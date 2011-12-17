package com.ma.games.shureBore.signal.service 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Line;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class OnServerAddLineSignal extends Signal 
	{
		
		public OnServerAddLineSignal() 
		{
			super(Line)
		}
		
	}

}
