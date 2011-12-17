package com.ma.games.shureBore.view 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class TimerView extends Sprite 
	{
		private static const TICK_SIZE:uint = 2;
		
		private Sprite fill;
		
		public TimerView() 
		{
			super();
			TimerSkin skin = new TimerSkin();
			fill = skin.TickSkin;
			addChild(skin);
		}
		
		internal void tick()
		{
			fill.width = fill.width + TICK_SIZE;
		}
		
		internal void clear()
		{
			//TODO: 
			fill.width = 2;
			//removeChild(fill);	
		}
		
		
	}

}
