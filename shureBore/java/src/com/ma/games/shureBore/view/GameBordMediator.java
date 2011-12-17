package com.ma.games.shureBore.view 
{
	import com.ma.games.shureBore.model.GameValues;
	import com.ma.games.shureBore.model.vo.Bore;
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.model.vo.Player;
	import com.ma.games.shureBore.model.vo.PPoint;
	import com.ma.games.shureBore.signal.controls.BoreHasUpdatedSignal;
	import com.ma.games.shureBore.signal.controls.InitBordSignal;
	import com.ma.games.shureBore.signal.controls.LineHasAddedSignal;
	import com.ma.games.shureBore.signal.controls.StopAlowFillBoreSignal;
	import com.ma.games.shureBore.signal.controls.TurnHasSwitchSignal;
	import com.ma.games.shureBore.signal.view.TryDrawLineSignal;
	import com.ma.games.shureBore.signal.view.TryToFillBoreSignal;
	import com.ma.games.shureBore.signal.view.TurnSignal;
	import org.robotlegs.mvcs.Mediator;

	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class GameBordMediator extends Mediator 
	{
		private static const FILL_BORE_STATE:uint = 0;
		private static const DROW_LINE_STATE:uint = 1;
		private static const WAITING_STATE:uint = 2;
		
		[Inject]
		public GameBordView view;
		
		[Inject]
		public InitBordSignal initBordSignal;
		
		[Inject]
		public TryToFillBoreSignal tryToFillBoreSignal;
		
		[Inject]
		public TryDrawLineSignal tryDrawLineSignal;
		
		[Inject]
		public BoreHasUpdatedSignal updateBoreSignal;
		
		[Inject]
		public StopAlowFillBoreSignal stopAlowFillBore;
		
		[Inject]
		public TurnHasSwitchSignal turnHasSwitchSignal;
		
		[Inject]
		public LineHasAddedSignal lineHasAddedSignal;
		
		
		//[Inject]
		private uint inputState;
		
		
		
		[Inject]
		public GameValues gameValue; 
		
		public GameBordMediator() 
		{
			super();
		}
		 public void onRegister()
		{
			initBordSignal.add(onInit);
			updateBoreSignal.add(onUpdateBore);
			stopAlowFillBore.add(onStopAlowFillBore);
			turnHasSwitchSignal.add(onTurnChange);
			lineHasAddedSignal.add(addNewLine);
		}
		
		private void addNewLine(Line line) 
		{
			view.addLine(line);
		}
		
		private void onStopAlowFillBore() 
		{
			view.boreClicked.remove(onClicked);
			view.lineDrawSignal.add(onNewLine);
			view.setBordDrawLineState();
		}
		
		private void onTurnChange() 
		{
			if (gameValue.isMyTurn())
			{
				view.boreClicked.add(onClicked);
				view.lineDrawSignal.add(onNewLine);
				view.setBoredFillBoreState();
			}
			else
			{
				view.lineDrawSignal.remove(onNewLine);
				view.boreClicked.remove(onClicked);
				view.setBordBlockState();
			}	
		}
		
		private void onNewLine(Line line) 
		{
			tryDrawLineSignal.dispatch(line);
		}
		
		private void onUpdateBore(Bore b,int playerIndex)
		{
			view.updateBore(b);
		}
		
		private void onInit(%#bord:Vector.<Vector.<Bore>>%#)
		{
			view.drow(bord);
			onTurnChange();
		}
		
		private void onClicked(PPoint p) 
		{
			trace(p.x);
			if (inputState == FILL_BORE_STATE)
			{
				tryToFillBoreSignal.dispatch(p);
			}
			else if(inputState == DROW_LINE_STATE)
			{
				
			}
			else if (inputState == WAITING_STATE)
			{
				trace("please wait Patiently")
			}
		}
		
	}

}
