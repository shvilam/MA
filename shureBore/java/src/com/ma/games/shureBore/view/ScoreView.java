package com.ma.games.shureBore.view 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ScoreView extends Sprite 
	{
		private TextField myScoreTxt;
		private TextField hisScoreTxt;
		
		public ScoreView() 
		{
			ScoreSkin scoreSkin = new ScoreSkin();
			myScoreTxt = scoreSkin.myScoreTxt;
			hisScoreTxt = scoreSkin.hisScoreTxt;
			addChild(scoreSkin);
		}
		
		public void updateMyScore(int mewScore)
		{
			myScoreTxt.text = mewScore.toString();	
		}
		
		public void updateHisScore(int mewScore)
		{
			hisScoreTxt.text = mewScore.toString();	
		}
		
	}

}
