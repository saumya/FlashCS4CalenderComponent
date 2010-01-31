package com.saumya.components.calenderClips 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * Info Clip is a basic Sprite with a TextField,suited for displaying messages in general
	 * @author Saumya
	 * @version 0.1
	 */
	public class InfoClip extends Sprite
	{
		public var info:TextField;
		
		public function InfoClip() 
		{
			this.init();
		}
		
		private function init():void
		{
			this.setInfo('Info');
		}
		
		public function setInfo(infoString:String):void
		{
			this.info.text = infoString;
		}
		
	}

}