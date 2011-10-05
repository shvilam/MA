package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class Line 
	{
		private var p1:PPoint;
		private var p2:PPoint;
		public function Line() 
		{
			
		}
		public function isEqual(line:Line):Boolean
		{
			if ( (p1.isEqual(line.p1) && p2.isEqual(line.p2) )||
				 (p2.isEqual(line.p1) && p1.isEqual(line.p2)) )
				{
					return true;
				}
				return false;	
		}
		
		public function toObj():Object
		{
			var obj:Object = new Object();
			obj.p1 = p1.toObj;
			obj.p2 = p2.toObj;
			return obj;
		}
		
		public static function create(obj:Object):Line
		{
			var line:Line = new Line();
			line.p1 = PPoint.create(obj.p1);
			line.p2 = PPoint.create(obj.p2);
			return line;
		}
	}

}