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
		internal TextField text;
		private TurnIndecatorSkin skin 
		public TurnView() 
		{
			super();
			skin = new TurnIndecatorSkin();
			addChild(skin);
		}
		
		internal void setMyTurn() 
		{
			skin.gotoAndStop("MY_TURN");
			
		}
		
		internal void setHisTurn() 
		{
			skin.gotoAndStop("HIS_TURN");
		}
	}

}
