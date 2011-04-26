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
		public var status:uint;
		public var point:Point;
		public function get strState():String {
			return (status == EMPTY)?"0":"X"
		}
		public function Bore() 
		{
		}
		
	}

}