package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class PPoint extends Object
	{
		public var x:int = -1;
		public var y:int = -1;
		
		public function PPoint(x:int=-1,y:int=-1) 
		{
			this.x = x;
			this.y = y;
		}
		public function toString():String
		{
			return "x: " + x + " y: " + y;
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
		
		public function isValid(): Boolean 
		{
			return (x >= 0 && y >= 0)?true:false;
		}
		
	}

}