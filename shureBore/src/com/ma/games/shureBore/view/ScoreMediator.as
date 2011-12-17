package com.ma.games.shureBore.view
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.signal.controls.ScoreHasUpdateSignal;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class ScoreMediator extends Mediator
	{
		[Inject]
		public var view:ScoreView;
		
		[Inject]
		public var scoreHasUpdateSignal:ScoreHasUpdateSignal;
		
		[Inject(name="Player.me")]
		public var me:Player;
		
		[Inject]
		public var gameValues:GameValues;
		
		public override function onRegister():void
		{
			scoreHasUpdateSignal.add(onScoreUpdate);
			view.updateMyScore(0); // set init score to 0
			view.updateHisScore(0); // set init score to 0
		}
		
		private function onScoreUpdate(p:Player):void
		{
			if (me.playerIndex == p.playerIndex)
			{
				view.updateMyScore(gameValues.myScore);
			}
			else
			{
				view.updateHisScore(gameValues.hisScore);
			}
		}
	
	}

}