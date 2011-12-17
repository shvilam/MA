package com.ma.games.shureBore.command.server 
{
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.signal.controls.LineHasAddedSignal;
	import com.ma.games.shureBore.signal.controls.ScoreHasUpdateSignal;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author ...
	 */
	public class AddLineCommand extends SignalCommand 
	{
		[Inject]
		public var gameValues:GameValues;
		
		[Inject]
		public var gameBordModel:GameBordModel;
		
		[Inject]
		public var line:Line;
		
		[Inject]
		public var lineHasAddedSignal:LineHasAddedSignal;
		
		[Inject]
		public var scoreHasUpdateSignal:ScoreHasUpdateSignal
		
		public override function execute():void
		{
			gameBordModel.addLine(line);
			lineHasAddedSignal.dispatch(line);
			if (gameValues.isMyTurn()) // TODO: this should be fix the line should be include to hom it belong
			{
				gameValues.addPintsToMe(line.numOfBore);
			}
			else
			{
				gameValues.addPintsToHis(line.numOfBore);
			}
			scoreHasUpdateSignal.dispatch(gameValues.howsTurn);
		}
		
	}

}