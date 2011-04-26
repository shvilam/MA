package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.Point;
	import com.ma.games.shureBore.signal.BoreClickedSignal;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class BordView extends MovieClip 
	{
		
		private static const CIRCEL_RADIOS:uint = 10;
		private static const SPACE:int = -3;
		//private var bord:Vector.<Vector.<Bore>>;
		
		
		public var boreClicked:BoreClickedSignal
			
		public function BordView() 
		{
			boreClicked = new BoreClickedSignal();
		}
		
		internal function updateBore(b:Bore):void
		{
			createBore(b);
		}
		
		internal function drow(bord:Vector.<Vector.<Bore>>):void
		{
			var boreView:MovieClip;
			for (var i:uint= 0 ;i<bord.length; i++)
			{
				for (var j:uint = 0 ; j < bord[i].length; j++)
				{
					boreView = createBore(bord[i][j]);
					
				}
			}
		}
		private function getBore(p:Point):MovieClip
		{
			return getChildByName("bore_" + p.x  + "_" + p.y) as MovieClip;
		}
		
		private function createBore(b:Bore):MovieClip
		{
			var boreView:MovieClip = getBore(b.point);
			if (boreView != null)
			{
				boreView.removeEventListener(MouseEvent.CLICK, onClick);
				removeChild(boreView);
			}
			boreView = new MovieClip();
			boreView.addEventListener(MouseEvent.CLICK, onClick);
			addChild(boreView);
			if (b.status == Bore.EMPTY)
			{
				boreView.graphics.beginFill(464654, 1)
			}
			else
			{
				boreView.graphics.beginFill(000234, 2);
			}
			boreView.graphics.drawCircle(b.point.x * CIRCEL_RADIOS * SPACE, b.point.y * CIRCEL_RADIOS * SPACE, CIRCEL_RADIOS);
			boreView.graphics.endFill();
			boreView.name = "bore_" + b.point.x  + "_" + b.point.y;
			return boreView;
		}
		private function onClick(evt:MouseEvent):void
		{
			var p:Point = getPoint(evt.target as MovieClip);
			boreClicked.dispatch(p);
		}
		
		private function getPoint(mc:MovieClip):Point
		{
			var parts:Array = mc.name.split("_");
			var x:uint = parseInt(parts[1]);
			var y:uint = parseInt(parts[2]);
			var p:Point = new Point(x, y);
			return p;
		}
		
	}

}