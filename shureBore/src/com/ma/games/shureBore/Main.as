package com.ma.games.shureBore
{
	//import asunit.textui.TestRunner;
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	import flash.events.Event;
	import tests.AllTests;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			if (CONFIG2::unittests)
			{
				var unittests:TestRunner = new TestRunner();
				stage.addChild(unittests);
				unittests.start(tests.AllTests, null, TestRunner.SHOW_TRACE);
			}
			else
			{
				removeEventListener(Event.ADDED_TO_STAGE, init);
				var co:ShureBoreContect = new ShureBoreContect(this);
			}
		}
		
	}
	
}