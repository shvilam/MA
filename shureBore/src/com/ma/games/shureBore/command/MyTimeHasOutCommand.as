package com.ma.games.shureBore.command 
{
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.model.vo.PPoint;
	import com.ma.games.shureBore.signal.view.TryToFillBoreSignal;
	import com.ma.games.shureBore.signal.view.TurnSignal;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class MyTimeHasOutCommand extends SignalCommand
	{
		[Inject]
		public var gameModel:GameBordModel;
		
		[Inject]
		public var gameValues:GameValues;
		
		[Inject]
		public var turnSignal:TurnSignal;
		
		[Inject]
		public var tryToFillBoreSignal:TryToFillBoreSignal;
		
		[Inject(name="Player.his")] 
		public var his:Player;
		
		override public function execute():void
		{
			if (gameValues.isBoreFill == false)
			{
				//find rundom bore fill it 
				var point:PPoint = gameModel.getRandomEmptyBore();
				tryToFillBoreSignal.dispatch(point);
				
			}
			turnSignal.dispatch(his);
		}
	}

}