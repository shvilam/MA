package com.ma.games.shureBore
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class Main extends Sprite 
	{
		
		public void Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private void init(Event e=null) 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			ShureBoreContect co = new ShureBoreContect(this);
			// entry point
		}
		
	}
	
}
