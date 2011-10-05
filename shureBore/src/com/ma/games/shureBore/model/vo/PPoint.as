package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class PPoint 
	{
		public var x:int;
		public var y:int;
		
		public function PPoint(x:uint=0,y:uint=0) 
		{
			this.x = x;
			this.y = y;
		}
		
		public function isEqual(p:PPoint):Boolean
		{
			if (x == p.x && y == p.y)
			{
				return true;
			}
			return false;
		}
		
		public static function create(obj:Object):PPoint
		{
			var p:PPoint = new PPoint(parseInt(obj["x"]), parseInt(obj["y"]));
			
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