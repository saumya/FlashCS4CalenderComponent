package com.saumya.components.calenderClips 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	
	/**
	 * @author Saumya
	 * @version 0.1
	 */
	
	public class DateBtn extends Sprite
	{
		public var dtValue:TextField;
		public var hiliteClip:Sprite;
		
		public static const DATE_SELETED_EVENT:String = "dateSelectedEvent";
		
		/**
		 * Constructor
		 */
		public function DateBtn() 
		{
			//trace(this, ' : Constructor : ');
			this.init();
		}
		
		/**
		 * 
		 */
		private function init():void
		{
			//trace(this, ' : init : ');
			this.hilite(false);
			this.addEventListener(MouseEvent.CLICK,onUserClick);
		}
		
		/**
		 * 
		 * @param	e MouseEvent
		 */
		private function onUserClick(e:MouseEvent):void 
		{
			//trace(this, ' : onUserClick : ');
			var dtSelectEvent:Event = new Event(DateBtn.DATE_SELETED_EVENT, true);
			this.dispatchEvent(dtSelectEvent);
		}
		
		/**
		 * Sets the date valule on this clip
		 */
		public function setDate(date:uint):void 
		{
			this.dtValue.text = date.toString();
		}
		
		/**
		 * Returns the user selected date
		 * @return selected date
		 */
		public function getDate():uint 
		{
			return (uint(this.dtValue.text));
		}
		
		/**
		 * 
		 * @param	shouldHilite
		 */
		public function hilite(shouldHilite:Boolean=false):void
		{
			this.hiliteClip.visible = shouldHilite;
		}
		
	}

}