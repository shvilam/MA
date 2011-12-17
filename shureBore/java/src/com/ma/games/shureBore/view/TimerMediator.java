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
		public TimerView view;
		
		[Inject]
		public TurnHasSwitchSignal turnHasSwitchSignal;
		
		[Inject]
		public TimeEndedSignal timeEndedSignal;
		
		[Inject]
		public GameValues gameValues;
		
		[Inject(name="Player.me")] 
		public Player me;
		
		[Inject(name="Player.his")] 
		public Player his;
		
		private Timer timer;
		
		public TimerMediator() 
		{
			super();
			
		}
		public void onRegister()
		{
			timer = new Timer(1000, 30);
			timer.addEventListener(TimerEvent.TIMER, onTick);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, timeHasEnded);
			startTimer();
			turnHasSwitchSignal.add(onTurnChange);
		}
		
		private void startTimer() 
		{
			timer.reset();
			timer.start();
		}
		
		private void timeHasEnded(TimerEvent e) 
		{
			if (gameValues.isMyTurn()) // if this my trun it my resposbilty to say it over
			{
				//turnSignal.dispatch(his);
				timeEndedSignal.dispatch();
			}
			view.clear();
		}
		
		private void onTick(TimerEvent e) 
		{
			if (e.target.currentCount == 7)
			{ 
				startWarning()
			}
			view.tick();
		}
		
		private void startWarning() 
		{
			
		}
		
		private void onTurnChange() 
		{
			startTimer();
			view.clear();
		}
		
	}

}
