package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class PPoint extends Object
	{
		public int x = -1;
		public int y = -1;
		
		public PPo((int)int x=-1,int y=-1) 
		{
			this.x = x;
			this.y = y;
		}
		public String toString()
		{
			return "x: " + x + " y: " + y;
		}
		
		public boolean isEqual(PPoint p)
		{
			if (x == p.x && y == p.y)
			{
				return true;
			}
			return false;
		}
		
		public static PPoint create(Object obj)
		{
			PPoint p = new PPo((int)parseInt(obj["x"]), parseInt(obj["y"]));
			
			return p;
		}
		
		public Object toObj()
		{
			Object obj= new Object();
			obj["x"] = x;
			obj["y"] = y;
			return obj;
		}
		
		public boolean isValid() 
		{
			return (x >= 0 && y >= 0)?true:false;
		}
		
	}

}
