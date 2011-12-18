package com.ma.games.shureBore.view
{
	import com.gskinner.sprites.*;
	import com.ma.games.shureBore.model.vo.*;
	import com.ma.games.shureBore.signal.view.*;
	import flash.display.*;
	import flash.events.*;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class GameBordView extends MovieClip
	{
		
		private static const CIRCEL_RADIOS:uint = 10; // size of the bore
		private static const SPACE:int = 5; // the space beteewn bore 
		
		private var exsistinglines:MovieClip;
		private var line:Line;
		private var lineMc:MovieClip;
		private var bord_size:uint;
		
		internal var boreClicked:BoreClickedSignal;
		internal var lineDrawSignal:LineDrawSignal;
		
		public function GameBordView()
		{
			boreClicked = new BoreClickedSignal();
			lineDrawSignal = new LineDrawSignal();
			line = new Line();
			lineMc = new MovieClip();
			exsistinglines = new MovieClip();
			addChild(exsistinglines)
			addChild(lineMc);
		}
		
		public function addLine(line:Line):void 
		{
			var boreView1:MovieClip = getBore(line.p1);
			var boreView2:MovieClip = getBore(line.p2);
			var addedLineMc:MovieClip = new MovieClip();
			
			addedLineMc.graphics.clear()
			addedLineMc.graphics.moveTo(boreView1.x, boreView1.y);
			addedLineMc.graphics.lineStyle(5, 28222, 0.5);
			addedLineMc.graphics.lineTo(boreView2.x, boreView2.y);
			addedLineMc.graphics.endFill();
			exsistinglines.addChild(addedLineMc);
			
		}
		
		
		
		internal function updateBore(b:Bore):void
		{
			var boreView:MovieClip = getBore(b.point);
			setBoreByStatus(boreView, b.status);
		}
		
		internal function drow(bord:Vector.<Vector.<Bore>>):void
		{
			var boreView:MovieClip;
			bord_size = bord.length;
			trace(bord_size)
			for (var iX:uint = 0; iX < bord.length; iX++)
			{
				for (var iY:uint = 0; iY < bord[iX].length; iY++)
				{
					boreView = createBore(bord[iX][iY]);
				}
			}
		}
		
		
		private function createBore(b:Bore):MovieClip
		{
			var boreView:MovieClip = new MovieClip();
			boreView.name = "bore_" + b.point.x + "_" + b.point.y;
			boreView.x = b.point.x * CIRCEL_RADIOS * SPACE;
			boreView.y = b.point.y * CIRCEL_RADIOS * SPACE;
			setBoreByStatus(boreView, b.status);
			addChild(boreView);
			return boreView;
		}
		
		internal function setBoredFillBoreState():void
		{
			var boreView:MovieClip;
			var lineSize:uint;
			for (var i:uint = 0; i < bord_size; i++)
			{
				lineSize = i + 1;
				for (var j:uint = 0; j < lineSize; j++)
				{
					boreView = getBore(new PPoint(i, j));
					boreView.removeEventListener(MouseEvent.MOUSE_DOWN, onStartLine);
					boreView.addEventListener(MouseEvent.CLICK, onBoreClicked);
				}
			}
		}
		
		internal function setBordDrawLineState():void
		{
			for (var i:uint = 0; i < bord_size; i++)
			{
				var lineSize:uint = i + 1;
				for (var j:uint = 0; j < lineSize; j++)
				{
					var boreView:MovieClip = getBore(new PPoint(i, j));
					boreView.removeEventListener(MouseEvent.CLICK, onBoreClicked);
					boreView.addEventListener(MouseEvent.MOUSE_DOWN, onStartLine);
				}
			}
			
		}
		
		internal function setBordBlockState():void 
		{
			var lineSize:uint;
			var boreView:MovieClip;
			for (var iX:uint = 0; iX < bord_size; iX++)
			{
				lineSize = iX + 1;
				for (var iY:uint = 0; iY < lineSize; iY++)
				{
					boreView = getBore(new PPoint(iX, iY));
					boreView.removeEventListener(MouseEvent.CLICK, onBoreClicked);
					root.removeEventListener(MouseEvent.MOUSE_UP, onEndLine);
					boreView.removeEventListener(MouseEvent.MOUSE_DOWN, onStartLine);
				}
			}
			
		}
		
		private function onBoreClicked(e:MouseEvent):void
		{
			var p:PPoint = getPoint(e.target as MovieClip);
			boreClicked.dispatch(p);
		}
		
		private function onEndLine(evt:MouseEvent):void
		{
			var boreView:MovieClip;
			var lineSize:uint;
			root.removeEventListener(Event.ENTER_FRAME, drowLine);
			root.removeEventListener(MouseEvent.MOUSE_UP, onEndLine);
			lineMc.graphics.clear();
			for (var iX:uint = 0; iX < bord_size; iX++)
			{
				lineSize = iX + 1;
				for (var iY:uint = 0; iY < lineSize; iY++)
				{
					boreView = getBore(new PPoint(iX, iY));
					restorHigthLigthBore(boreView);
				}
			}
			
			var p:PPoint = getPoint(evt.target as MovieClip);
			line.p2 = p;
			if (line.isValid())
			{
				lineDrawSignal.dispatch(line);
			}
		}
		
		private function onStartLine(evt:MouseEvent):void
		{
			
			var p:PPoint = getPoint(evt.target as MovieClip);
			if (p.isValid())
			{
				line = new Line();
				line.p1 =  p;
				var boreView:MovieClip = getBore(p);
				setHigthLigthBore(boreView);
				
				root.addEventListener(MouseEvent.MOUSE_UP, onEndLine);
				root.addEventListener(Event.ENTER_FRAME, drowLine);
			}
		}
		
		private function drowLine(e:Event):void
		{
			var lineSize:uint;
			var boreView:MovieClip;
			var mc:MovieClip = getBore(line.p1);
			lineMc.graphics.clear()
			lineMc.graphics.moveTo(mc.x, mc.y);
			lineMc.graphics.lineStyle(10, 2222, 0.3);
			lineMc.graphics.lineTo(mouseX, mouseY);
			lineMc.graphics.endFill();
			for (var i:uint = 0; i < bord_size; i++)
			{
				lineSize = i + 1;
				for (var j:uint = 0; j < lineSize; j++)
				{
					boreView = getBore(new PPoint(i, j));
					if (PixelPerfectCollisionDetection.isColliding(boreView, lineMc, boreView.parent, true))
					{
						setHigthLigthBore(boreView);
					}
					else
					{
						restorHigthLigthBore(boreView);
					}
				}
			}
		}
		private function restorHigthLigthBore(boreView:MovieClip):void
		{
			switch (boreView.status)
			{
				case Bore.HIGTH_LIGTH_EMPTY: 
					setBoreByStatus(boreView, Bore.EMPTY);
					break;
				case Bore.HIGTH_LIGTH_FULL: 
					setBoreByStatus(boreView, Bore.FULL);
					break;
				default:
					//throw new Error("Unknon bore status");
			}
		}
		
		private function setHigthLigthBore(boreView:MovieClip):void
		{
			switch (boreView.status)
			{
				case Bore.EMPTY: 
					setBoreByStatus(boreView, Bore.HIGTH_LIGTH_EMPTY);
					break;
				case Bore.FULL: 
					setBoreByStatus(boreView, Bore.HIGTH_LIGTH_FULL);
					break;
				default:
					//throw new Error("Unknon bore status");	
			}
		}
		
		private function setBoreByStatus(boreView:MovieClip, status:int):void
		{
			boreView.graphics.clear();
			boreView.status = status;
			switch (status)
			{
				case Bore.EMPTY: 
					drowEmptyBore(boreView);
					break;
				case Bore.FULL: 
					drowFullBore(boreView);
					break;
				case Bore.HIGTH_LIGTH_EMPTY: 
					drowEmptyHigthLigthBore(boreView);
					break;
				case Bore.HIGTH_LIGTH_FULL: 
					drowFullHigthLigthBore(boreView);
					break;
			}
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
			boreView.graphics.beginFill(1654, 0.2)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS + 4);
			boreView.graphics.endFill();
			boreView.graphics.beginFill(114, 1)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS);
			boreView.graphics.endFill();
		}
		
		private function drowEmptyHigthLigthBore(boreView:MovieClip):void
		{
			boreView.graphics.beginFill(464664, 0.1)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS + 4);
			boreView.graphics.endFill();
			boreView.graphics.beginFill(113354, 0.2)
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS);
			boreView.graphics.endFill();
		}
		
		private function getPoint(mc:MovieClip):PPoint
		{
			var p:PPoint = new PPoint();
			if (mc != null && mc.name.indexOf("_")!= -1)
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
		
		private function getBore(p:PPoint):MovieClip
		{
			return getChildByName("bore_" + p.x + "_" + p.y) as MovieClip;
		}
		
	
	}

}