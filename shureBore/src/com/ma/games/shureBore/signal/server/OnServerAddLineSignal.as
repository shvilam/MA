package com.ma.games.shureBore.signal.server 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Line;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class OnServerAddLineSignal extends Signal 
	{
		
		public function OnServerAddLineSignal() 
		{
			super(Line)
		}
		
	}

}