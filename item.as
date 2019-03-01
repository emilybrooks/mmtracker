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
	public class item extends Entity
	{
		protected var enableGraphic:Image;
		protected var disableGraphic:Image;
		protected const DISABLED:uint = 0;
		protected const ENABLED:uint = 1;
		protected var state:uint;
		//for darkening the disabled graphic. 1 is normal brightness and 0 is completely dark
		protected const DISABLE_BRIGHTNESS_MULTIPLIER:Number = 0.5;
		/**
		 * Regular items that just toggle on and off.
		 * @param	x			X coordinate of the top left corner of the item.
		 * @param	y			Y coordinate of the top left corner of the item.
		 * @param	img			The item's image.
		 * @param	enabled		Should the item be enabled when you launch the program?
		 */
		public function item(x:int, y:int, img:Class, enabled:Boolean = false) 
		{
			enableGraphic = new Image(img);
			
			//create a second copy of the item image that is desaturated
			//for when the item hasn't clicked yet
			var desaturated:Bitmap = new img;
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
			disableGraphic = new Image(desaturated.bitmapData);
			
			if (enabled)
			{
				enable();
			}
			else
			{
				disable();
			}
			super(x, y);
			setHitbox(enableGraphic.width, enableGraphic.height)
		}
		/**
		 * When clicked toggle the item's state
		 */
		override public function update():void
		{
			if (Input.mousePressed || Input.mousePressedRight)
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
		 * Set the graphic to the colored version and update the state
		 */
		protected function enable():void
		{
			state = ENABLED;
			graphic = enableGraphic;
		}
		/**
		 * Set the graphic to the desaturated version and update the state
		 */
		protected function disable():void
		{
			state = DISABLED;
			graphic = disableGraphic;
		}
	}
}