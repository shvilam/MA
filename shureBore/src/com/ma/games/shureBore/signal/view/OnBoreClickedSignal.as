package com.ma.games.shureBore.signal.view 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.PPoint;
	/**
	 * ...
	 * @author Shvilam
	 */ 
	public class OnBoreClickedSignal extends Signal
	{
		
		public function OnBoreClickedSignal() 
		{
			super(PPoint);
		}
		
	}

}