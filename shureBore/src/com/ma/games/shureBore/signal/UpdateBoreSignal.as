package com.ma.games.shureBore.signal 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Bore;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class UpdateBoreSignal extends Signal 
	{
		
		public function UpdateBoreSignal() 
		{
			super(Bore, int);
		}
		
	}

}