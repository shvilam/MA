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
		public GameBordModel gameModel;
		
		[Inject]
		public PPoint p;
		
		[Inject]
		public int playerIndex;
		
		[Inject]
		public BoreHasUpdatedSignal updateBoreSignal;
		
		public FillBoreCommand() 
		{
			
		}
		 public void execute()
		{
			Bore bore = gameModel.fillBore(p);
			updateBoreSignal.dispatch(bore, playerIndex);
		}
		
	}

}
