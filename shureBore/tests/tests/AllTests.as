package tests 
{
	import asunit.framework.TestSuite;
	/**
	 * ...
	 * @author Shvilam
	 */
	public class AllTests extends TestSuite
	{
		
		public function AllTests()
		{		
		  super();
		  addTest(new TestGameBordModel("TestInit"));
        }
		
	}

}