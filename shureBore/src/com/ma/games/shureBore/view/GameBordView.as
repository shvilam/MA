package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.PPoint;
	import com.ma.games.shureBore.signal.view.BoreClickedSignal;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class GameBordView extends MovieClip 
	{
		
		private static const CIRCEL_RADIOS:uint = 10;
		private static const SPACE:int = -3;
		//private var bord:Vector.<Vector.<Bore>>;
		
		private var line:Vector.<PPoint>;
		private var lineMc:MovieClip;
		private var bord:Vector.<Vector.<Bore>>
		
		public var boreClicked:BoreClickedSignal
			
		public function GameBordView() 
		{
			boreClicked = new BoreClickedSignal();
			line = new Vector.<PPoint>();
			lineMc = new MovieClip();
			addChild(lineMc);
		}
		
		internal function updateBore(b:Bore):void
		{
			var boreView:MovieClip = getBore(b.point);
			trace("b.status " + b.status);
			setBoreByStatus(boreView, b.status);
		}
		
		internal function drow(bord:Vector.<Vector.<Bore>>):void
		{
			var boreView:MovieClip;
			this.bord = bord;
			for (var i:uint= 0 ;i<bord.length; i++)
			{
				for (var j:uint = 0 ; j < bord[i].length; j++)
				{
					boreView = createBore(bord[i][j]);
				}
			}
		}
		private function getBore(p:PPoint):MovieClip
		{
			return getChildByName("bore_" + p.x  + "_" + p.y) as MovieClip;
		}
		
		private function createBore(b:Bore):MovieClip
		{
			var boreView:MovieClip = new MovieClip();
			boreView.name = "bore_" + b.point.x  + "_" + b.point.y;
			boreView.x = b.point.x * CIRCEL_RADIOS * SPACE;
			boreView.y = b.point.y * CIRCEL_RADIOS * SPACE;
			root.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			setBoreByStatus(boreView, b.status);
			addChild(boreView);
			return boreView;
		}
		
		private function restorHigthLigthBore(boreView:MovieClip):void 
		{
			switch(boreView.status)
			{
				case Bore.HIGTH_LIGTH_EMPTY:
					setBoreByStatus(boreView, Bore.EMPTY);
					break;
				case Bore.HIGTH_LIGTH_FULL:
					setBoreByStatus(boreView, Bore.FULL);
					break;
			}
		}
		private function setHigthLigthBore(boreView:MovieClip):void 
		{
			switch(boreView.status)
			{
				case Bore.EMPTY:
					setBoreByStatus(boreView, Bore.HIGTH_LIGTH_EMPTY);
					break;
				case Bore.HIGTH_LIGTH_FULL:
					setBoreByStatus(boreView, Bore.HIGTH_LIGTH_FULL);
					break;
			}
		}
		
		private function setBoreByStatus(boreView:MovieClip,status:int):void 
		{
			boreView.graphics.clear();
			boreView.status = status;
			switch(status)
			{
				case Bore.EMPTY:
					drowEmptyBore(boreView);
					break;
				case Bore.FULL:
					drowFullBore(boreView);
					boreView.addEventListener(MouseEvent.MOUSE_DOWN, onDwon);
					break;
				case Bore.HIGTH_LIGTH_EMPTY:
					drowEmptyHigthLigthBore(boreView);
					break;	
				case Bore.HIGTH_LIGTH_FULL:
					drowFullHigthLigthBore(boreView);
					break;	
			}
		}
		
		
		
		private function onDwon(evt:MouseEvent):void 
		{
			var p:PPoint = getPoint(evt.target as MovieClip);
			var boreView:MovieClip = getBore(p);
			setHigthLigthBore(boreView);
			line.push(p);
			root.addEventListener(MouseEvent.MOUSE_MOVE, drowLine);
			
		}
		
		private function drowLine(e:Event):void 
		{
			trace("line.length: " + line.length + " lineMc.numChildren: " + lineMc.numChildren);
			var p:PPoint = line[line.length - 1];
			var mc:MovieClip = getBore(p);
			lineMc.graphics.clear()
			lineMc.graphics.moveTo(mc.x, mc.y);
			lineMc.graphics.lineStyle(10, 2222, 0.3);
			lineMc.graphics.lineTo(mouseX, mouseY);
			lineMc.graphics.endFill();
				
		}
		private function drowFullBore(boreView:MovieClip):void
		{
			boreView.graphics.beginFill(163354, 1);
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS);
			boreView.graphics.endFill();
		}
		
		private function drowEmptyBore(boreView:MovieClip):void
		{
			boreView.graphics.beginFill(163354, 0.2)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS);
			boreView.graphics.endFill();
		}
		private function drowFullHigthLigthBore(boreView:MovieClip):void
		{
			
			boreView.graphics.beginFill(464654, 0.1)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS+4);
			boreView.graphics.endFill();
			boreView.graphics.beginFill(163354, 0.2)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS);
			boreView.graphics.endFill();
		}
		private function drowEmptyHigthLigthBore(boreView:MovieClip):void
		{
			boreView.graphics.beginFill(464654, 0.1)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS+4);
			boreView.graphics.endFill();
			boreView.graphics.beginFill(163354, 1)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS);
			boreView.graphics.endFill();
		}
		
		private function isPointInLineExsist(p:PPoint):Boolean 
		{
			for (var i:int = 0; i < line.length; i++)
			{
				if (p.isEqual(line[i]))
				{
					return true;
				}
			}
			return false;
		}
		
		private function onMouseUp(evt:MouseEvent):void
		{
			lineMc.graphics.clear();
			root.removeEventListener(MouseEvent.MOUSE_MOVE, drowLine);
			var p:PPoint = getPoint(evt.target as MovieClip);
			boreClicked.dispatch(p);
		}
		
		private function getPoint(mc:MovieClip):PPoint
		{
			var p:PPoint = null;
			if (mc != null)
			{
				
				var parts:Array = mc.name.split("_");
				if (parts != null && parts.length > 0)
				{
					var x:uint = parseInt(parts[1]);
					var y:uint = parseInt(parts[2]);
					p = new PPoint(x, y);
				}
				
			}
			return p;
		}
		
	}

}