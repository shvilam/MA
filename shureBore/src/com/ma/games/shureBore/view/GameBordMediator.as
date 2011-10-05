package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.model.vo.PPoint;
	import com.ma.games.shureBore.signal.controls.BoreHasUpdatedSignal;
	import com.ma.games.shureBore.signal.controls.InitBordSignal;
	import com.ma.games.shureBore.signal.controls.StopAlowFillBore;
	import com.ma.games.shureBore.signal.controls.TurnHasSwitchSignal;
	import com.ma.games.shureBore.signal.view.TryToFillBoreSignal;
	import com.ma.games.shureBore.signal.view.TurnSignal;
	import org.robotlegs.mvcs.Mediator;

	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class GameBordMediator extends Mediator 
	{
		private static const FILL_BORE_STATE:uint = 0;
		private static const DROW_LINE_STATE:uint = 1;
		private static const WAITING_STATE:uint = 2;
		
		[Inject]
		public var view:GameBordView;
		
		[Inject]
		public var initBordSignal:InitBordSignal;
		
		[Inject]
		public var tryToFillBoreSignal:TryToFillBoreSignal;
		
		[Inject]
		public var updateBoreSignal:BoreHasUpdatedSignal;
		
		[Inject]
		public var stopAlowFillBore:StopAlowFillBore;
		
		[Inject]
		public var turnHasSwitchSignal:TurnHasSwitchSignal;
		
		//[Inject]
		private var inputState:uint;
		
		
		
		[Inject]
		public var gameValue:GameValues; 
		
		public function GameBordMediator() 
		{
			super();
		}
		override public function onRegister():void
		{
			initBordSignal.add(onInit);
			updateBoreSignal.add(onUpdateBore);
			stopAlowFillBore.add(onStopAlowFillBore);
			turnHasSwitchSignal.add(onTurnChange);
		}
		
		private function onStopAlowFillBore():void 
		{
			view.boreClicked.remove(onClicked);
		}
		
		private function onTurnChange():void 
		{
			if (gameValue.isMyTurn())
			{
				view.boreClicked.add(onClicked);
			}
			else
			{
				view.boreClicked.remove(onClicked);
			}	
		}
		
		private function onUpdateBore(b:Bore, playerIndex:int):void
		{
			view.updateBore(b);
		}
		
		private function onInit(bord:Vector.<Vector.<Bore>>):void
		{
			view.drow(bord);
			onTurnChange();
		}
		
		private function onClicked(p:PPoint):void 
		{
			trace(p.x);
			if (inputState == FILL_BORE_STATE)
			{
				tryToFillBoreSignal.dispatch(p);
			}
			else if(inputState == DROW_LINE_STATE)
			{
				
			}
			else if (inputState == WAITING_STATE)
			{
				trace("please wait Patiently")
			}
		}
		
	}

}