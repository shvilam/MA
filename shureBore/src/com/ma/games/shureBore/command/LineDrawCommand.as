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
		public var line:Line;
		
		[Inject]
		public var gameBordModel:GameBordModel;
		
		[Inject]
		public var messageSender:MessageSender;
		
		public override function execute():void
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