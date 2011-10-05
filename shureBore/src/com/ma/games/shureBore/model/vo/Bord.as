package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class Bord 
	{
		public var bord:Vector.<Vector.<Bore>>;
		public var lines:Vector.<Line>;
		private var bordSize:int;
		
		public function get size():uint {
			return bordSize;
		}
		public function Bord(size:uint)
		{
			var line:String = "";
			bordSize = size;
			lines = new Vector.<Line>();
			bord = new Vector.<Vector.<Bore>>(size);
			for (var i:int= 0 ;i<bord.length; i++)
			{
				line = "";
				var lineSize:uint = i + 1;
				bord[i] = new Vector.<Bore>(lineSize)
				for (var j:int= 0 ; j < bord[i].length; j++)
				{
					
					bord[i][j] = new Bore();
					bord[i][j].point = new PPoint(i, j);
					bord[i][j].status = Bore.EMPTY;
					line+=	bord[i][j].strState
				}
				trace(line);
			}
			bord[0][0].status = Bore.FULL;
			bord[bord.length-1][bord.length-1].status  = Bore.FULL;
		}
		
		
		
	}

}