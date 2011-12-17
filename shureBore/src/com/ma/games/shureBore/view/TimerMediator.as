package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.command.server.TurnHasSwitchCommand;
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.signal.controls.TurnHasSwitchSignal;
	import com.ma.games.shureBore.signal.view.TimeEndedSignal;
	import com.ma.games.shureBore.signal.view.TurnSignal;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
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
		public var turnHasSwitchSignal:TurnHasSwitchSignal;
		
		[Inject]
		public var timeEndedSignal:TimeEndedSignal;
		
		[Inject]
		public var gameValues:GameValues;
		
		[Inject(name="Player.me")] 
		public var me:Player;
		
		[Inject(name="Player.his")] 
		public var his:Player;
		
		private var timer:Timer;
		
		public function TimerMediator() 
		{
			super();
			
		}
		public override function onRegister():void
		{
			timer = new Timer(1000, 30);
			timer.addEventListener(TimerEvent.TIMER, onTick);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timeHasEnded);
			startTimer();
			turnHasSwitchSignal.add(onTurnChange);
		}
		
		private function startTimer():void 
		{
			timer.reset();
			timer.start();
		}
		
		private function timeHasEnded(e:TimerEvent):void 
		{
			if (gameValues.isMyTurn()) // if this my trun it my resposbilty to say it over
			{
				//turnSignal.dispatch(his);
				timeEndedSignal.dispatch();
			}
			view.clear();
		}
		
		private function onTick(e:TimerEvent):void 
		{
			if (e.target.currentCount == 7)
			{ 
				startWarning()
			}
			view.tick();
		}
		
		private function startWarning():void 
		{
			
		}
		
		private function onTurnChange():void 
		{
			startTimer();
			view.clear();
		}
		
	}

}