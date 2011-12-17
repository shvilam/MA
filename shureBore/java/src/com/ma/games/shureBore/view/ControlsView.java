package com.ma.games.shureBore.view 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent
	import org.osflash.signals.natives.NativeSignal;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class ControlsView extends Sprite 
	{
		internal NativeSignal turnClickSignal;
		
		public ControlsView() 
		{
			super();
			ControlsSkin skin = new ControlsSkin();
			
			
			turnClickSignal = new NativeSignal(skin.TurnButton,MouseEvent.MOUSE_DOWN,MouseEvent)
			addChild(skin);
			
			
		}
		
		
	}

}
