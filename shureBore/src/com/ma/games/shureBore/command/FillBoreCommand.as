package com.ma.games.shureBore.command 
{
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.Point;
	import com.ma.games.shureBore.signal.UpdateBoreSignal;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class FillBoreCommand extends Command 
	{
		[Inject]
		public var gameModel:GameBordModel;
		
		[Inject]
		public var p:Point;
		
		[Inject]
		public var playerIndex:int;
		
		public var updateBoreSignal:UpdateBoreSignal;
		
		public function FillBoreCommand() 
		{
			
			
		}
		override public function execute():void
		{
			var bore:Bore = gameModel.fillBore(p);
			updateBoreSignal.dispatch(bore, playerIndex);
		}
		
	}

}