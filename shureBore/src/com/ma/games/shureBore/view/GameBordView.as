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
		}
		
		internal function updateBore(b:Bore):void
		{
			createBore(b);
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
			var boreView:MovieClip = getBore(b.point);
			if (boreView != null)
			{
				boreView.removeEventListener(MouseEvent.MOUSE_UP, onClick);
				removeChild(boreView);
			}
			boreView = new MovieClip();
			boreView.addEventListener(MouseEvent.MOUSE_UP, onClick);
			boreView.addEventListener(MouseEvent.MOUSE_DOWN, onDwon);
			
			addChild(boreView);
			if (b.status == Bore.EMPTY)
			{
				boreView.graphics.beginFill(464654, 1)
			}
			else
			{
				boreView.graphics.beginFill(000234, 2);
			}
			boreView.graphics.drawCircle(0, 0, CIRCEL_RADIOS);
			boreView.x = b.point.x * CIRCEL_RADIOS * SPACE;
			boreView.y = b.point.y * CIRCEL_RADIOS * SPACE;
			
			boreView.graphics.endFill();
			boreView.name = "bore_" + b.point.x  + "_" + b.point.y;
			return boreView;
		}
		
		private function onOver(e:MouseEvent):void 
		{
			trace("XXXXXXXXXXXXXXXXX")
			if (line.length > 0)
			{
				var p:PPoint = getPoint(e.target as MovieClip);
				line.push(p);
				var section:MovieClip = new MovieClip();
				lineMc.addChild(section);
			}
		}
		
		private function onDwon(evt:MouseEvent):void 
		{
			
			if (line.length == 0)
			{
				var p:PPoint = getPoint(evt.target as MovieClip);
				line.push(p);
				root.addEventListener(MouseEvent.MOUSE_MOVE, drowLine);
				lineMc = new MovieClip();
				var section:MovieClip = new MovieClip();
				lineMc.addChild(section);
				this.addChild(lineMc);
				trace("lineMc.numChildren " +  lineMc.numChildren);
				trace("line " + line.length);
			}
			
			
			
		}
		
		private function drowLine(e:Event):void 
		{
			trace("line.length: " + line.length + " lineMc.numChildren: " + lineMc.numChildren);
			var removePrevios:Boolean = true;
			if (line.length > 0 && lineMc.numChildren > 0)
			{
				trace("mouseX, mouseY " +root.mouseX+ "  " + root.mouseY );
				trace("getBore(new Point(i, j)) " + getBore(new PPoint(i, j)).x+ "  " +getBore(new PPoint(i, j)).y);
				for (var i:uint= 0 ;i<bord.length; i++)
				{
					for (var j:uint = 0 ; j < bord[i].length; j++)
					{
						if (getBore(new PPoint(i, j)).hitTestPoint(root.mouseX, root.mouseY))
						{
							
							var p:PPoint = getPoint(e.target as MovieClip);
							if (!isPointInLineExsist(p))
							{
								line.push(p);
								var section:MovieClip = new MovieClip();
								lineMc.addChild(section);
								removePrevios = false;
								return;
							}
						}
					}
				}
				
				lineMc.removeChildAt(lineMc.numChildren - 1);
				var p:PPoint = line[line.length - 1];
				trace("p:" ,p.x,p.y)
				
				var mc:MovieClip = getBore(p);
				var section:MovieClip = new MovieClip();
				lineMc.addChild(section);
				section.graphics.beginFill(22222, 0.5);
				trace("mc: " ,mc.x, mc.y);
				section.graphics.moveTo(mc.x, mc.y);
				section.graphics.lineStyle(15, 2222, 0.5);
				section.graphics.lineTo(mouseX, mouseY);
				section.graphics.endFill();
			}	
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
		
		private function onClick(evt:MouseEvent):void
		{
			root.removeEventListener(Event.ENTER_FRAME, drowLine);
			var p:PPoint = getPoint(evt.target as MovieClip);
			boreClicked.dispatch(p);
		}
		
		private function getPoint(mc:MovieClip):PPoint
		{
			trace("mc.name: "+ mc.name)
			var parts:Array = mc.name.split("_");
			var x:uint = parseInt(parts[1]);
			var y:uint = parseInt(parts[2]);
			var p:PPoint = new PPoint(x, y);
			return p;
		}
		
	}

}