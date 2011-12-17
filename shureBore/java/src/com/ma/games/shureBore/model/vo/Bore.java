package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class Bore 
	{
		public static const EMPTY:int = 0;
		public static const FULL:int = 1;
		public static const HIGTH_LIGTH_EMPTY:int = 2;
		public static const HIGTH_LIGTH_FULL:int = 3;
		
		public uint status;
		public PPoint point;
		public function get strState():String {
			return (status == EMPTY)?"0":"X"
		}
		public Bore() 
		{
		}
		
	}

}
