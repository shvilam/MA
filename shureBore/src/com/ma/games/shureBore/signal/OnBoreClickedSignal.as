package com.ma.games.shureBore.signal 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Point;
	/**
	 * ...
	 * @author Shvilam
	 */ 
	public class OnBoreClickedSignal extends Signal
	{
		
		public function OnBoreClickedSignal() 
		{
			super(Point);
		}
		
	}

}