package com.ma.games.shureBore.view 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class TurnView extends Sprite 
	{
		private static const MY_TURN:String 	= "MY_TURN";
		private static const HIS_TURN:String 	= "HIS_TURN";
		internal var text:TextField;
		private var skin:TurnIndecatorSkin 
		public function TurnView() 
		{
			super();
			skin = new TurnIndecatorSkin();
			addChild(skin);
		}
		
		internal function setMyTurn():void 
		{
			skin.gotoAndStop(MY_TURN);
			
		}
		
		internal function setHisTurn():void 
		{
			skin.gotoAndStop(HIS_TURN);
		}
	}

}