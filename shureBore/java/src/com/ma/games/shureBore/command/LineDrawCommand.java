package com.ma.games.shureBore.command 
{
	import com.ma.games.shureBore.model.GameBordModel;
	import com.ma.games.shureBore.model.vo.Line;
	import com.ma.games.shureBore.servise.MessageSender;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class LineDrawCommand extends Command 
	{
		[Inject]
		public Line line;
		
		[Inject]
		public GameBordModel gameBordModel;
		
		[Inject]
		public MessageSender messageSender;
		
		public void execute()
		{
			line.numOfBore = gameBordModel.isValidLine(line)
			if (line.numOfBore > 0)
			{
				
				messageSender.addLineBore(line);
			}
			else
			{
				
			}
		}
		
	}

}
