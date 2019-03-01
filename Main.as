package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	public class Main extends Engine
	{
		public function Main()
		{
			//I couldn't get it to run at a stable 60 fps, not sure that it matters
			super(300, 506, 30, true);
			FP.world = new trackerWorld;
			//FP.console.enable();
		}

		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
	}
}