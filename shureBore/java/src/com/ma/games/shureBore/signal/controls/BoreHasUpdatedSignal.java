package com.ma.games.shureBore.signal.controls 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Bore;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class BoreHasUpdatedSignal extends Signal 
	{
		
		public BoreHasUpdatedSignal() 
		{
			super(Bore, int);
		}
		
	}

}
