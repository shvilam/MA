package com.ma.games.shureBore.model 
{
	import com.ma.games.shureBore.model.vo.Bord;
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.model.vo.PPoint;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * handle game logic
	 * @author Shvilam
	 */
	public class GameBordModel extends Actor 
	{
		public var gameBord:Bord;
		
		public function get bordSize():uint {
			return gameBord.size;
		}
		
		
		public function init(size:uint):void
		{
			gameBord = new Bord(size);
			print();
		}
		
		public function getBore(p:PPoint):Bore
		{
			return gameBord.bord[p.x][p.y];
		}
		
		public function fillBore(p:PPoint):Bore
		{
			gameBord.bord[p.x][p.y].status = Bore.FULL;
			return gameBord.bord[p.x][p.y];
		}
		
		public function isValidLine(line:Line):int
		{
			var numOfBore:int = 0;
			if (!isLineExsist(line))
			{
				if (line.p1.x + line.p1.y > line.p2.x + line.p2.y) //setting the point in the rigth order
				{
					var pTmp:PPoint = line.p1;
					line.p1 = line.p2;
					line.p2 = pTmp; 
				}
				trace("p1: " + line.p1.toString())
				trace("p2: " + line.p2.toString())
				trace("gameBord.bord[line.p2.x].length " +  gameBord.bord[line.p2.x].length);   
				if (line.p1.x == line.p2.x && line.p1.y == 0 && line.p2.y == line.p1.x) // xLine
				{
					trace("yy")
					//is all bore fill
					for (var i:int = 0; i < line.p2.y; i++ )
					{
						if (gameBord.bord[line.p1.x][i].status == Bore.EMPTY)
						{
							trace("not all bore is filled in that line");
							return -1;
						}
						else 
						{
							numOfBore = numOfBore + 1;
						}
					}
					return numOfBore;
				}
				else if (line.p1.x == line.p1.y && line.p1.x == line.p1.y && line.p2.x == gameBord.bord.length-1) // yLine
				{
					trace("xx")
					//is all bore fill
					for (var j:int = line.p1.x; j < bordSize; j++ )
					{
						trace("gameBord.bord["+j + " ]["+ line.p1.x +"].status:  " + gameBord.bord[j][line.p1.x].status);
						if (gameBord.bord[j][line.p1.x].status == Bore.EMPTY)
						{
							trace("not all bore is filled in that line");
							return -1;
						}
						else 
						{
							numOfBore = numOfBore + 1;
						}
					}
					return numOfBore;

				}
				else if ((line.p1.y + line.p1.x) == (line.p2.x + line.p2.y)) // yLine
				{
					for (var Ix:int = 0; Ix < bordSize; Ix++)
					{
						for (var Iy:int = 0; Iy < bordSize; Iy++)
						{
							//if in bord
							if (gameBord.bord.length > Ix && gameBord.bord[Ix].length > Iy)
							{
								// if is sum are equal
								if ((Ix + Iy) == (line.p1.y + line.p1.x))
								{
									if(gameBord.bord[Ix][Iy].status == Bore.EMPTY)
									{
										trace("not all bore is filled in that line");
										return -1;
									}
									else 
									{
										numOfBore = numOfBore + 1;
									}
								}
							}
						}
						
					}
					
					return numOfBore;
				}
				else if ( ((line.p1.y  + line.p1.x + line.p2.y  + line.p2.x) == (bordSize * 2 - 2))  && line.p1.x == 0 && line.p2.y == bordSize-1 )
				{
						trace("the rigth line")
				}
			}
			return -1;
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
		
		public function hasMoreLines():Boolean 
		{
			return (gameBord.lines.length < (gameBord.size * gameBord.size))
		}
		
		/**
		 * TODO: not realy random. need to replace to random
		 * @return
		 */
		public function getRandomEmptyBore():PPoint 
		{
			for (var i:uint= 0 ;i<gameBord.bord.length; i++)
			{
				for (var j:uint = 0 ; j < gameBord.bord[i].length; j++)
				{
					if (gameBord.bord[i][j].status == Bore.EMPTY)
					{
						return gameBord.bord[i][j].point;
					}
				}
			}
			return null;
		}
		
		/**
		 * util print the bords 
		 * TODO: need to prints line as well
		 */
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
		
		
		
	}

}