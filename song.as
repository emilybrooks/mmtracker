package 
{
	import net.flashpunk.utils.Input;
	public class song extends item 
	{
		protected const SONG_BAR_WIDTH:uint = 36;
		protected var check:checkmark;
		protected var checkstate:uint = DISABLED;
		protected var id:String;
		/**
		 * Song's act like regular items for left clicks, but when right clicked have a checkmark to indicate if the location itself has been checked.
		 * @param	x			X coordinate of the top left corner of the item.
		 * @param	y			Y coordinate of the top left corner of the item.
		 * @param	img			The item's image.
		 * @param	enabled		Should the item be enabled when you launch the program?
		 */
		public function song(x:int, y:int, img:Class, enabled:Boolean = false) 
		{
			super(x, y, img, enabled);
			this.id = id;
			setHitbox(enableGraphic.width, enableGraphic.height);
			//create the checkmark here so we can keep track of it
			check = new checkmark(x, y, enabled);
		}
		override public function added():void 
		{
			//flashpunk doesn't like adding entities before the world is created or something
			world.add(check);
		}
		/**
		 * toggle this item's state or the checkmark's state depending on which mouse click happened
		 */
		override public function update():void 
		{
			if (Input.mousePressed)
			{
				if (mouseCollide())
				{
					if (state == ENABLED)
					{
						disable();
					}
					else
					{
						enable();
					}
				}
			}
			else if (Input.mousePressedRight)
			{
				if (mouseCollide())
				{
					if (this.check.getState() == ENABLED)
					{
						this.check.disable();
					}
					else
					{
						this.check.enable();
					}
				}
			}
		}
	}
}