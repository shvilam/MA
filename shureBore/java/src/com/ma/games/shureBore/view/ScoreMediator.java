package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.signal.controls.LineHasAddedSignal;
	import com.ma.games.shureBore.signal.controls.ScoreHasUpdateSignal;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class ScoreMediator extends Mediator 
	{
		[Inject]
		public ScoreView view;
		
		[Inject]
		public ScoreHasUpdateSignal scoreHasUpdateSignal;
		
		
		[Inject(name="Player.me")] 
		public Player me;
		
		[Inject]
		public GameValues gameValues;
		
		public ScoreMediator() 
		{
			
		}
		
		public void onRegister()
		{
			scoreHasUpdateSignal.add(onScoreUpdate);
			view.updateMyScore(0);
			view.updateHisScore(0);
		}
		
		private void onScoreUpdate(Player p) 
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
