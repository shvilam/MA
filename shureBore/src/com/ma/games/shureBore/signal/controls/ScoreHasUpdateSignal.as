package com.ma.games.shureBore.signal.controls 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Player;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class ScoreHasUpdateSignal extends Signal 
	{
		
		public function ScoreHasUpdateSignal() 
		{
			super(Player)
		}
		
	}

}