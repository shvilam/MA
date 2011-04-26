package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class Point 
	{
		public var x:int;
		public var y:int;
		
		public function Point(x:uint=0,y:uint=0) 
		{
			this.x = x;
			this.y = y;
		}
		
		public function isEqual(p:Point):Boolean
		{
			if (x == p.x && y == p.y)
			{
				return true;
			}
			return false;
		}
		
		public static function create(obj:Object):Point
		{
			var p:Point = new Point(parseInt(obj["x"]), parseInt(obj["y"]));
			
			return p;
		}
		
		public function toObj():Object
		{
			var obj:Object= new Object();
			obj["x"] = x;
			obj["y"] = y;
			return obj;
		}
		
	}

}