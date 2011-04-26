package com.ma.games.shureBore.signal.server 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Point
	/**
	 * ...
	 * @author Shvilam
	 */
	public class OnServerFillBoreSignal extends Signal 
	{
		
		public function OnServerFillBoreSignal() 
		{
			super(Point)
		}
		
	}

}