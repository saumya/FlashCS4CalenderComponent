package com.saumya.components.calenderClips 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	
	/**
	 * the user button to display the initial button
	 * @author Saumya
	 * @version 0.1
	 */
	public class DatePickerBtn extends Sprite
	{
		public var resultText:TextField;
		
		public function DatePickerBtn() 
		{
			this.init();
		}
		
		private function init():void
		{
			//trace(this, ' : init : ');
			this.doubleClickEnabled = true;
		}
		
		public function setValueOfDate(dateValue:String):void
		{
			//trace(this, ' : setValueOfDate : ');
			this.resultText.text = dateValue;
		}
		
	}

}