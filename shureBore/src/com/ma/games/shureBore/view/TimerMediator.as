package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.signal.view.TimeEndedSignal;
	import com.ma.games.shureBore.signal.view.TurnSignal;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class TimerMediator extends Mediator
	{
		[Inject]
		public var view:TimerView;
		
		[Inject]
		public var turnSignal:TurnSignal;
		
		[Inject]
		public var timeEndedSignal:TimeEndedSignal;
		
		public function TimerMediator() 
		{
			super();
			
		}
		public override function onRegister():void
		{
			turnSignal.add(onTurnChange);
		}
		
		private function onTurnChange(p:Player):void 
		{
			view.clear();
		}
	}

}