package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.Point;
	import com.ma.games.shureBore.signal.InitBordSignal;
	import com.ma.games.shureBore.signal.TryToFillBoreSignal;
	import com.ma.games.shureBore.signal.UpdateBoreSignal;
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
		public var view:BordView;
		
		[Inject]
		public var initBordSignal:InitBordSignal;
		
		[Inject]
		public var tryToFillBoreSignal:TryToFillBoreSignal;
		[Inject]
		public var updateBoreSignal:UpdateBoreSignal;
		
		private var inputState:uint;
		
		public function GameBordMediator() 
		{
			super();
		}
		override public function onRegister():void
		{
			initBordSignal.add(onInit);
			view.boreClicked.add(onClicked);
			updateBoreSignal.add(onUpdateBore)
		}
		private function onUpdateBore(b:Bore, playerIndex:int):void
		{
			view.updateBore(b);
		}
		
		private function onInit(bord:Vector.<Vector.<Bore>>):void
		{
			view.drow(bord);
		}
		private function onClicked(p:Point):void 
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