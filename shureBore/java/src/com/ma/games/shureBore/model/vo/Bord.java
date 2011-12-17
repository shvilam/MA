package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class Bord 
	{
		public Vector bord.<Vector.<Bore>>;
		public Vector lines.<Line>;
		private int bordSize;
		
		public function get size():uint {
			return bordSize;
		}
		public Bord(uint size)
		{
			String line = "";
			bordSize = size;
			lines = new Vector.<Line>();
			bord = new Vector.<Vector.<Bore>>(size);
			for (int i= 0 ;i<bord.length; i++)
			{
				line = "";
				uint lineSize = i + 1;
				bord[i] = new Vector.<Bore>(lineSize)
				for (int j= 0 ; j < bord[i].length; j++)
				{
					
					bord[i][j] = new Bore();
					bord[i][j].point = new PPo((int)i, j);
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
