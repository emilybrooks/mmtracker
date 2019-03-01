package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import flash.display.Bitmap;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.utils.Input;
	public class progressive extends Entity
	{
		protected var enableGraphic:Image;
		protected var disableGraphic:Image;
		protected var state:uint = 0;
		protected var graphics:Array = [];
		protected var twin:progressive;
		//for darkening the disabled graphic. 1 is normal brightness and 0 is completely dark
		protected const DISABLE_BRIGHTNESS_MULTIPLIER:Number = 0.5;
		/**
		 * Items that cycle through multiple icons.
		 * @param	x			X coordinate of the top left corner of the item.
		 * @param	y			Y coordinate of the top left corner of the item.
		 * @param	images		Array of all the item icons this progressive item should cycle through
		 * @param	enabled		Should the item be enabled when you launch the program?	
		 */
		public function progressive(x:int, y:int, images:Array, enabled:Boolean = false) 
		{
			//create a second copy of the first item that is desaturated
			//for when the item hasn't been clicked yet
			var desaturated:Bitmap = new images[0];
			//multipliers from http://www.laurenscorijn.com/articles/colormath-basics
			var rLum : Number = 0.299 * DISABLE_BRIGHTNESS_MULTIPLIER;
			var gLum : Number = 0.587 * DISABLE_BRIGHTNESS_MULTIPLIER;
			var bLum : Number = 0.114 * DISABLE_BRIGHTNESS_MULTIPLIER; 
			var matrix:Array = [rLum, gLum, bLum, 0, 0,
								rLum, gLum, bLum, 0, 0,
								rLum, gLum, bLum, 0, 0,
								0,    0,    0,    1, 0];
			var filter:ColorMatrixFilter = new ColorMatrixFilter( matrix );
			desaturated.bitmapData.applyFilter(desaturated.bitmapData, new Rectangle(0, 0, desaturated.width, desaturated.height), new Point(), filter);
			graphics.push(new Image(desaturated.bitmapData));
			
			//make graphics for all the other items
			for (var i:uint =  0; i < images.length; i++)
			{
				graphics.push(new Image(images[i]));
			}
			
			setHitbox(graphics[0].width, graphics[0].height);
			if (enabled)
			{
				state = 1;
			}
			super(x, y, graphics[state]);
		}
		/**
		 * When left clicked go forward in the cycle, when right clicked go backwards.
		 * All the graphics are stored in an array, 0 is the desaturated copy, 1 is the colored copy, and the rest are the other items.
		 */
		override public function update():void
		{
			
			if (Input.mousePressed)
			{
				if (mouseCollide())
				{
					//if you're at the last item in the list you should only be able to go backwards
					if (state < graphics.length - 1)
					{
						state++;
					}
				}
			}
			else if (Input.mousePressedRight)
			{
				if (mouseCollide())
				{
					//if you're at the first item in the list you should only be able to go forwards
					if (state > 0)
					{
						state--;
					}
				}
			}
			else
			{
				return;
			}
			
			//make the twin item match this item
			if (twin != null)
			{
				twin.setState(state);
			}
			graphic = graphics[state];
		}
		/**
		 * Check if the mouse is inside the item's hitbox 
		 */
		protected function mouseCollide():Boolean
		{
			if(collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				return true;
			}
			return false;
		}
		/**
		 * Twins are the same item that have multiple items on the tracker.
		 * Basically these are the bomb/bombbag and bow/quiver.
		 * When one item gets updated, the other should as well.
		 * @param	twin	Item to share this item's state with.
		 */
		public function setTwin(twin:progressive):void
		{
			this.twin = twin;
		}
		/**
		 * Update this item's state.
		 * @param	state	What state to assign.
		 */
		public function setState(state:uint):void
		{
			this.state = state;
			graphic = graphics[state];
		}
	}
}