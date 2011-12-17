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
		public GameBordModel gameModel;
		
		[Inject]
		public GameValues gameValues;
		
		[Inject]
		public TurnSignal turnSignal;
		
		[Inject]
		public TryToFillBoreSignal tryToFillBoreSignal;
		
		[Inject(name="Player.his")] 
		public Player his;
		
		 public void execute()
		{
			if (gameValues.isBoreFill == false)
			{
				//find rundom bore fill it 
				PPoint point = gameModel.getRandomEmptyBore();
				tryToFillBoreSignal.dispatch(point);
				
			}
			turnSignal.dispatch(his);
		}
	}

}
