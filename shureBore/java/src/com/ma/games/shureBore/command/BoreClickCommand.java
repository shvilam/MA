package com.ma.games.shureBore.command 
{
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.PPoint;
	import com.ma.games.shureBore.servise.MessageSender;
	import com.ma.games.shureBore.signal.controls.StopAlowFillBoreSignal;
	import org.robotlegs.mvcs.SignalCommand;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class BoreClickCommand  extends SignalCommand
	{
		[Inject]
		public StopAlowFillBoreSignal stopAlowFillBore;
		
		[Inject]
		public PPoint p;
		
		[Inject]
		public GameBordModel gameModel;
		
		[Inject]
		public MessageSender sender;
		
		[Inject]
		public GameValues gameValues;
		
		 public void execute()
		{
			Bore bore = gameModel.getBore(p);
			if (bore.status == Bore.EMPTY)
			{
				gameValues.isBoreFill = true;
				sender.fillBore(p);
				stopAlowFillBore.dispatch();
				
			}
		}
	}

}
