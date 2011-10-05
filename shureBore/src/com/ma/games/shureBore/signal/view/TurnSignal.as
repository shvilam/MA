package com.ma.games.shureBore.signal.view 
{
	import org.osflash.signals.Signal;
	import com.ma.games.shureBore.model.vo.Player
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class TurnSignal extends Signal 
	{
		
		public function TurnSignal() 
		{
			super(Player)
		}
		
	}

}