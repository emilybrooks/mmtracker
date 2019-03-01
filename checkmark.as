package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	public class checkmark extends Entity 
	{
		protected var icon:Image;
		protected var state:uint;
		protected const DISABLED:uint = 0;
		protected const ENABLED:uint = 1;
		/**
		 * Checkmarks for the song items. They should be added in the song class.
		 * @param	x			X coordinate of the top left corner of the item.
		 * @param	y			Y coordinate of the top left corner of the item.
		 * @param	enabled		Should the item be enabled when you launch the program?	
		 */
		public function checkmark(x:int, y:int, enabled:Boolean = false)
		{
			icon = new Image(A.check);
			//magic numbers are bad but I'm lazy
			super(x + 28, y - 5, icon);
			if (enabled)
			{
				enable();
			}
			else
			{
				disable();
			}
		}
		/**
		 * Show the graphic and update the state.
		 */
		public function enable():void
		{
			state = ENABLED;
			icon.alpha = 1;
			graphic = icon;
		}
		/**
		 * Hide the graphic and update the state.
		 */
		public function disable():void
		{
			state = DISABLED;
			icon.alpha = 0;
			graphic = icon;
		}
		public function getState():uint
		{
			return state;
		}
	}
}