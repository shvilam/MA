package com.ma.games.shureBore.model 
{
	import com.ma.games.shureBore.model.vo.Bord;
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.model.vo.Point;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class GameBordModel extends Actor 
	{
		public var gameBord:Bord;
		public function get bordSize():uint {
			return gameBord.size;
		}
		public function GameBordModel() 
		{
			
		}
		
		public function init(size:uint):void
		{
			gameBord = new Bord(size);
			print();
		}
		
		public function print():void
		{
			var line:String = "";
			for (var i:uint= 0 ;i<gameBord.bord.length; i++)
			{
				line = "";
				for (var j:uint = 0 ; j < gameBord.bord[i].length; j++)
				{
					line+=	gameBord.bord[i][j].strState
				}
				trace(line);
			}
		}
		public function getBore(p:Point):Bore
		{
			return gameBord.bord[p.x][p.y];
		}
		
		public function fillBore(p:Point):Bore
		{
			gameBord.bord[p.x][p.y].status = Bore.FULL;
			return gameBord.bord[p.x][p.y];
		}
		
		private function isValidLine(line:Line):void
		{
			isLineExsist(line);
		}
		private function isLineExsist(line:Line):Boolean
		{
			for (var i:int = 0; i <gameBord.lines.length; i++) 
			{
				if (gameBord.lines[i].isEqual(line))
					return true;
			}
			return false;
		}
		private function addLine(line:Line):void
		{
			
		}
		
		public function hasMoreLines():Boolean 
		{
			return (gameBord.lines.length < (gameBord.size * gameBord.size))
		}
		
	}

}