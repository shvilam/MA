package com.ma.games.shureBore.command.server
{
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.PPoint;
	import com.ma.games.shureBore.signal.controls.BoreHasUpdatedSignal;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class FillBoreCommand extends SignalCommand
	{
		[Inject]
		public var gameModel:GameBordModel;
		
		[Inject]
		public var p:PPoint;
		
		[Inject]
		public var playerIndex:int;
		
		[Inject]
		public var updateBoreSignal:BoreHasUpdatedSignal;
		
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