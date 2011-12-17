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
		
		private var fill:Sprite;
		
		public function TimerView() 
		{
			super();
			var skin:TimerSkin = new TimerSkin();
			fill = skin.TickSkin;
			addChild(skin);
		}
		
		internal function tick():void
		{
			fill.width = fill.width + TICK_SIZE;
		}
		
		internal function clear():void
		{
			//TODO: 
			fill.width = 2;
			//removeChild(fill);	
		}
		
		
	}

}