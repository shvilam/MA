package com.ma.games.shureBore.view 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * display the socre of the 2 users 
	 * @author Shvilam
	 */
	public class ScoreView extends Sprite 
	{
		private var myScoreTxt:TextField;
		private var hisScoreTxt:TextField;
		
		public function ScoreView() 
		{
			var scoreSkin:ScoreSkin = new ScoreSkin();
			myScoreTxt = scoreSkin.myScoreTxt;
			hisScoreTxt = scoreSkin.hisScoreTxt;
			addChild(scoreSkin);
		}
		/**
		 * 
		 * @param mewScore
		 */
		public function updateMyScore(mewScore:int):void
		{
			myScoreTxt.text = mewScore.toString();	
		}
		
		/**
		 * 
		 * @param	mewScore
		 */
		public function updateHisScore(mewScore:int):void
		{
			hisScoreTxt.text = mewScore.toString();	
		}
		
	}

}