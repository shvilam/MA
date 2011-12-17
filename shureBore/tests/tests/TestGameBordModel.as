package tests
{
	import asunit.framework.TestCase;
	import com.ma.games.shureBore.model.GameBordModel;
	
	/**
	 * ...
	 * @author Shvilam
	 */
	public class TestGameBordModel extends TestCase
	{
		
		public function TestGameBordModel(testMethod:String)
		{
			super(testMethod);
		}
		
		public function TestInit():void
		{
			var gameModel:GameBordModel = new GameBordModel();
			gameModel.init(5);
			assertEquals(gameModel.bordSize, 5);
			assertTrue(gameModel.hasMoreLines());
			assertNotNull(gameModel.getRandomEmptyBore());
		}
		
	
	}

}