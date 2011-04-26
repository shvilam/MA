package com.ma.games.shureBore.signal 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Bore;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class InitBordSignal extends Signal 
	{
		
		public function InitBordSignal() 
		{
			super(Vector.<Vector.<Bore>>)
		}
		
	}

}