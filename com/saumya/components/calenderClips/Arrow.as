package com.saumya.components.calenderClips 
{
	import flash.display.Sprite;
	/**
	 * Creates the navigation arrow button
	 * @author Saumya
	 * @version 0.1
	 */
	public class Arrow extends Sprite
	{
		private var isNavTypeSet:Boolean = false;
		private var sideType:String = 'RIGHT';//LEFT,RIGHT (todo:  UP,DOWN)
		
		public function Arrow() 
		{
			this.init();
		}
		
		private function init():void
		{
			//trace(this, ' : init : ');
		}
		
		/**
		 * Displays the arraow as its pointing left
		 * The x position is also changed as to fake as if its the same clip in the same position
		 */
		public function displayAsLeftNavigation():void
		{
			if (this.isNavTypeSet)
			{
				//Do nothing
			}else {
				this.scaleX = -1;
				this.x = this.x + this.width;
				//this.sideType = 'LEFT';
				this.isNavTypeSet = true;
			}
		}
		
		public function displayAsRightNavigation():void
		{
			//Do nothing
			if (this.isNavTypeSet)
			{
				//Do nothing
			}else {
				this.scaleX = 1;
				this.x = this.x;
				//this.sideType = 'RIGHT';
				this.isNavTypeSet = true;
			}
		}
	}

}