package com.ma.games.shureBore.model.vo 
{
	/**
	 * line from one bore to the end bore 
	 * line from one point to the end point
	 * @author Shvilam
	 */
	public class Line 
	{
		public var p1:PPoint;
		public var p2:PPoint;
		
		public var numOfBore:int;
		
	
		public function isEqual(line:Line):Boolean
		{
			if ( (p1.isEqual(line.p1) && p2.isEqual(line.p2) )||
				 (p2.isEqual(line.p1) && p1.isEqual(line.p2)) )
				{
					return true;
				}
				return false;	
		}
		
		
		public function isValid():Boolean 
		{
			if (p1!= null && p2!=null && p1.isValid() && p2.isValid())
			{
				trace("p1 " + p1.toString())
				trace("p2 " + p2.toString())
				return (p1.isEqual(p2))?false:true;
			}
			else {
				return false;
			}
		}
		
		/**
		 * serialize the object
		 * @return
		 */
		public function toObj():Object
		{
			var obj:Object = new Object();
			obj.p1 = p1.toObj();
			obj.p2 = p2.toObj();
			obj.numOfBore = numOfBore;
			return obj;
		}
		/**
		 * deserialize 
		 * @param	obj
		 * @return
		 */
		public static function create(obj:Object):Line
		{
			var line:Line = new Line();
			line.p1 = PPoint.create(obj.p1);
			line.p2 = PPoint.create(obj.p2);
			line.numOfBore = obj.numOfBore;
			return line;
		}
	}

}