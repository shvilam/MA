package com.ma.games.shureBore.model.vo 
{
	/**
	 * ...
	 * @author Shvilam
	 */
	public class Line 
	{
		public PPoint p1;
		public PPoint p2;
		
		public int numOfBore;
		
		public Line() 
		{
			
		}
		public boolean isEqual(Line line)
		{
			if ( (p1.isEqual(line.p1) && p2.isEqual(line.p2) )||
				 (p2.isEqual(line.p1) && p1.isEqual(line.p2)) )
				{
					return true;
				}
				return false;	
		}
		
		public Object toObj()
		{
			Object obj = new Object();
			obj.p1 = p1.toObj();
			obj.p2 = p2.toObj();
			obj.numOfBore = numOfBore;
			return obj;
		}
		
		public static Line create(Object obj)
		{
			Line line = new Line();
			line.p1 = PPoint.create(obj.p1);
			line.p2 = PPoint.create(obj.p2);
			line.numOfBore = obj.numOfBore;
			return line;
		}
		
		public boolean isValid() 
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
	}

}
