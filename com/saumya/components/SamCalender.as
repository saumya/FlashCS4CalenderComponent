package com.saumya.components 
{
	import com.saumya.components.calenderClips.Arrow;
	import com.saumya.components.calenderClips.CloseDetailViewButton;
	import com.saumya.components.calenderClips.InfoClip;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import fl.core.UIComponent;
	
	import com.saumya.components.calenderClips.DateBtn;
	import com.saumya.components.calenderClips.DatePickerBtn;
	
	
	
	/**
	 * Calender component for Flash IDE
	 * @author Saumya
	 * @version 2.0
	 */

	public class SamCalender extends UIComponent
	{
		//declaring the visual elements
		//component parts
		private var resultClip:DatePickerBtn = null;
		private var closeDetailViewBtn:CloseDetailViewButton = null;
		
		private var backMonthBtn:Arrow = null;
		private var nextMonthBtn:Arrow = null;
		private var backYearBtn:Arrow = null;
		private var nextYearBtn:Arrow = null;
		private var dateSelectionDisplay:DatePickerBtn = null;
		private var infoMonth:InfoClip = null;
		private var infoYear:InfoClip = null;
		
		//The date variables
		private var userDate:Date = new Date();
		private var currentDate:Date = new Date();
		//
		private var userSelectedYear:uint = 2000;
		private var userSelectedMonth:uint = 1;
		private var userSelectedDay:uint = 1;
		//Component properties
		private var dtBox_1_mc:DateBtn = null;
		private var dtBox_2_mc:DateBtn = null;
		private var dtBox_3_mc:DateBtn = null;
		private var dtBox_4_mc:DateBtn = null;
		private var dtBox_5_mc:DateBtn = null;
		private var dtBox_6_mc:DateBtn = null;
		private var dtBox_7_mc:DateBtn = null;
		private var dtBox_8_mc:DateBtn = null;
		private var dtBox_9_mc:DateBtn = null;
		private var dtBox_10_mc:DateBtn = null;
		private var dtBox_11_mc:DateBtn = null;
		private var dtBox_12_mc:DateBtn = null;
		private var dtBox_13_mc:DateBtn = null;
		private var dtBox_14_mc:DateBtn = null;
		private var dtBox_15_mc:DateBtn = null;
		private var dtBox_16_mc:DateBtn = null;
		private var dtBox_17_mc:DateBtn = null;
		private var dtBox_18_mc:DateBtn = null;
		private var dtBox_19_mc:DateBtn = null;
		private var dtBox_20_mc:DateBtn = null;
		private var dtBox_21_mc:DateBtn = null;
		private var dtBox_22_mc:DateBtn = null;
		private var dtBox_23_mc:DateBtn = null;
		private var dtBox_24_mc:DateBtn = null;
		private var dtBox_25_mc:DateBtn = null;
		private var dtBox_26_mc:DateBtn = null;
		private var dtBox_27_mc:DateBtn = null;
		private var dtBox_28_mc:DateBtn = null;
		private var dtBox_29_mc:DateBtn = null;
		private var dtBox_30_mc:DateBtn = null;
		private var dtBox_31_mc:DateBtn = null;
		//
		
		
		/**
		 * Constructor
		 */
		public function SamCalender() 
		{
			//trace(this, ' : Constructor : ');
			super();
		}
		
		protected override function configUI():void
		{
			//trace(this, ' : configUI : ');
			super.configUI();
		}
		
		protected override function draw():void
		{
			//trace(this, ' : draw : ');
			//makes the buttons
				var j:uint = 0;
				var k:uint = 0;
				var l:uint = 0;
				for (var i:uint = 1; i <= 31; i++ )
				{
					var dtBox:DateBtn = new DateBtn();
					var name:String = 'dtBox_' + i + '_mc';
					this[name] = dtBox;
					l = (i - 1);
					j = (l % 7);
					if (j==0)
					{
						k++ ;
					}
					DateBtn(this[name]).x = j * 20;
					DateBtn(this[name]).y = (k-1) * 20;
					DateBtn(this[name]).setDate(i);//i is used for date calculations
					this.addChild(this[name]);
				}
			//creates home Button
			this.createHomeBtn();
			//creates the close button
			this.closeDetailViewBtn = new CloseDetailViewButton();
			this.closeDetailViewBtn.x = 140;
			this.closeDetailViewBtn.y = -10;
			this.closeDetailViewBtn.addEventListener(MouseEvent.CLICK,onCloseButtonClicked);
			this.addChild(this.closeDetailViewBtn);
			//creates the next-back Month buttons
			this.backMonthBtn = new Arrow();
			this.backMonthBtn.y = 110;
			this.backMonthBtn.x = 0;
			this.backMonthBtn.addEventListener(MouseEvent.CLICK,onBackMonthClick);
			this.backMonthBtn.displayAsLeftNavigation();
			this.addChild(backMonthBtn);
			this.nextMonthBtn = new Arrow();
			this.nextMonthBtn.y = 110;
			this.nextMonthBtn.x = 100;
			this.nextMonthBtn.addEventListener(MouseEvent.CLICK,onNextMonthClick);
			this.addChild(this.nextMonthBtn);
			//creates the next-back Year buttons
			this.backYearBtn = new Arrow();
			this.backYearBtn.y = 140;
			this.backYearBtn.x = 0;
			this.backYearBtn.addEventListener(MouseEvent.CLICK,onBackYearClick);
			this.backYearBtn.displayAsLeftNavigation();
			this.addChild(this.backYearBtn);
			this.nextYearBtn = new Arrow();
			this.nextYearBtn.y = 140;
			this.nextYearBtn.x = 100;
			this.nextYearBtn.addEventListener(MouseEvent.CLICK,onNextYearClick);
			this.addChild(this.nextYearBtn);
			//creates the selection display
			this.dateSelectionDisplay = new DatePickerBtn();
			this.dateSelectionDisplay.y = 180;
			this.dateSelectionDisplay.setValueOfDate(this.currentDate.toDateString());
			this.addChild(this.dateSelectionDisplay);
			//creates the infoclips
			this.infoMonth = new InfoClip();
			this.infoMonth.y = 110;
			this.infoMonth.x = 20;
			this.infoMonth.setInfo('MONTH');
			this.infoYear = new InfoClip();
			this.infoYear.y = 140;
			this.infoYear.x = 20;
			this.infoYear.setInfo('YEAR');
			this.addChild(this.infoMonth);
			this.addChild(this.infoYear);
			
			//initiates the view
			this.init();
			//last line
			super.draw();
		}
		
		private function onNextYearClick(e:MouseEvent):void 
		{
			//trace(this,' : onNextYearClick : year=',this.userDate.fullYear+1);
			var nextYear:uint = this.userDate.fullYear + 1;
			this.userDate.fullYear = nextYear;
			this.updateDateUI();
		}
		
		private function onBackYearClick(e:MouseEvent):void 
		{
			var lastYear:uint = this.userDate.fullYear - 1;
			this.userDate.fullYear = lastYear;
			this.updateDateUI();
		}
		
		private function onNextMonthClick(e:MouseEvent):void 
		{
			//trace(this,' : onNextMonthClick : ');
			if (this.userDate.month<=11)
			{
				var nextMonth:uint = this.userDate.month + 1;
			}else {
				//Do nothing
			}
			this.userDate.month = nextMonth;
			this.updateDateUI();
		}
		
		private function onBackMonthClick(e:MouseEvent):void 
		{
			if (this.userDate.month>1)
			{
				var lastMonth:uint = this.userDate.month - 1;
			}else {
				//Do nothing
			}
			this.userDate.month = lastMonth;
			this.updateDateUI();
		}
		
		private function onCloseButtonClicked(e:MouseEvent):void 
		{
			//trace(this,' : onCloseButtonClicked : ');
			this.showDetailView(false);
			this.resultClip.visible = true;
		}
		
		public override function setSize(w:Number,h:Number): void
		{
			//trace(this, ' : setSize : ');
		}
		
		/**
		 * Creates home button
		 */
		private function createHomeBtn():void
		{
			this.resultClip = new DatePickerBtn();
			this.resultClip.addEventListener(MouseEvent.CLICK, onDateSelection);
			this.addChild(this.resultClip);
		}
		
		private function init():void
		{
			//trace(this, ' : init : ');
			this.showDetailView(false);
			//add event handler for date selection
			this.addEventListener(DateBtn.DATE_SELETED_EVENT, onDateSelected);
			//displays todays date in the beginning
			this.resultClip.setValueOfDate(this.userDate.toDateString());
		}
		
		private function onDateSelected(e:Event):void 
		{
			//trace(this, ' : onDateSelected : ', e);
			var dtBtn:DateBtn = DateBtn(e.target);
			//trace(this, ' : onDateSelected : dtBtn=', dtBtn, ' : date=', dtBtn.getDate());
			var selectedDate:uint = dtBtn.getDate();
			this.userDate.date = selectedDate;
			//update the ui
			this.resultClip.setValueOfDate(this.userDate.toDateString());
			this.dateSelectionDisplay.setValueOfDate(this.userDate.toDateString());
			//hilite the seleted btn
			this.unHiliteDateButtons();//TODO: fix this
			dtBtn.hilite(true);
		}
		
		/**
		 * Hides/Shows the detail view to show up only the date chooser
		 */
		private function showDetailView(shouldShow:Boolean=false):void
		{
			//trace(this, ' : showDetailView : ');
			//hides the dates clips
			for (var i:uint = 1; i <= 31; i++ )
			{
				var name:String = 'dtBox_' + i + '_mc';
				DateBtn(this[name]).visible = shouldShow;
			}
			//
			this.closeDetailViewBtn.visible = shouldShow;
			this.backMonthBtn.visible = shouldShow;
			this.nextMonthBtn.visible = shouldShow;
			this.backYearBtn.visible = shouldShow;
			this.nextYearBtn.visible = shouldShow;
			this.dateSelectionDisplay.visible = shouldShow;
			this.infoMonth.visible = shouldShow;
			this.infoYear.visible = shouldShow;
		}
		
		/**
		 * Updates teh logic on a particular date select on UI
		 * @param	e
		 */
		private function onDateSelection(e:MouseEvent):void 
		{
			this.resultClip.visible = false;
			this.showDetailView(true);
			this.updateDateChooser();
		}
		
		///////////////////////////////////Utility Methods/////////////////////////////////////////
		
		/**
		 * Updates the date selection UI,each element on the UI
		 */
		private function updateDateUI():void
		{
			//trace(this,' : updateDateUI : userDate=',this.userDate);
			this.resultClip.setValueOfDate(this.userDate.toDateString());
			this.dateSelectionDisplay.setValueOfDate(this.userDate.toDateString());
			//
			this.infoMonth.setInfo(this.monthValue(this.userDate.getMonth()));
			this.infoYear.setInfo(this.userDate.getFullYear().toString());
			//
			this.unHiliteDateButtons();
			this.updateDateChooser();
		}
		
		/**
		 * Updates the date buttons on the UI
		 */
		private function updateDateChooser():void
		{
			//trace(this, ' : updateDateChooser : days=', this.userDate);
			//
			var numDaysInMonth:uint = this.daysInCurrentMonth(this.userDate);
			for (var j:uint = 0; j < 31; j++ ) 
			{
				var name:String = 'dtBox_' + (j + 1) + '_mc';
				for (var i:uint = 0; i < numDaysInMonth ; i++ )
				{
					if (j<=i)
					{
						DateBtn(this[name]).visible = true;
						//sets the value of the date
						DateBtn(this[name]).setDate(i+1);
					}else {
						DateBtn(this[name]).visible = false;
					}
				}
				//sets the value of the date
				DateBtn(this[name]).setDate(j + 1);
				//hilites today
				//this day
				var today:uint = this.currentDate.getDate();
				var thisMonth:uint = this.currentDate.getMonth();
				var thisYear:uint = this.currentDate.getFullYear();
				//user selected day
				var userdate:uint = this.userDate.getDate();
				var usermonth:uint = this.userDate.getMonth();
				var userYear:uint = this.userDate.getFullYear();
				
				if (today==(j+1))
				if ((today==userdate)&&(thisMonth==usermonth)&&(thisYear==userYear))
				{
					DateBtn(this[name]).hilite(true);
				}else {
					DateBtn(this[name]).hilite(false);
				}
			}
			
		}
		
		/**
		 * Removes hilights from all the date buttons
		 */
		private function unHiliteDateButtons():void
		{
			var numDaysInMonth:uint = this.daysInCurrentMonth(this.userDate);
			for (var i:uint = 0; i < numDaysInMonth ;i++ )
			{
				var name:String = 'dtBox_' + (i + 1) + '_mc';
				DateBtn(this[name]).hilite(false);
			}
		}
		
		/**
		 *  converts the month number to month string
		 */
		private function monthValue(month:uint):String
		{
			var mValue:String = 'Jan';
			switch(month)
			{
				case 0 : mValue = 'Jan';
				break;
				case 1 : mValue = 'Feb';
				break;
				case 2 : mValue = 'March';
				break;
				case 3 : mValue = 'April';
				break;
				case 4 : mValue = 'May';
				break;
				case 5 : mValue = 'June';
				break;
				case 6 : mValue = 'July';
				break;
				case 7 : mValue = 'Aug';
				break;
				case 8 : mValue = 'Sep';
				break;
				case 9 : mValue = 'Oct';
				break;
				case 10 : mValue = 'Nov';
				break;
				case 11 : mValue = 'Dec';
				break;
				default : mValue = 'Invalid';
				break;
			}
			
			return mValue;
		}
		
		/**
		 * Returns the number of days in provided argument month
		 */
		private function daysInCurrentMonth(day:Date):uint
		{
			var noOfDays:uint = 30;
			//
			//trace(this, ' : daysInCurrentMonth : date=', day );
			var monthNum:uint = day.getMonth();
			var yearNum:uint = day.getFullYear();
			var  isLeapYear:Boolean = false;
			if (yearNum%4==0)
			{
				isLeapYear = true;
			}else {
				isLeapYear = false;
			}
			switch(monthNum)
			{
				case 0 : noOfDays = 31;
				break;
				case 1 :
					if (isLeapYear)
					{
						noOfDays = 29;
					}else {
						noOfDays = 28;
					}
				break;
				case 2 : noOfDays = 31;
				break;
				case 3 : noOfDays = 30;
				break;
				case 4 : noOfDays = 31;
				break;
				case 5 : noOfDays = 30;
				break;
				case 6 : noOfDays = 31;
				break;
				case 7 : noOfDays = 31;
				break;
				case 8 : noOfDays = 30;
				break;
				case 9 : noOfDays = 31;
				break;
				case 10 : noOfDays = 30;
				break;
				case 11 : noOfDays = 31;
				break;
				default : noOfDays = 30;
				break;
			}
			//trace(this, ' : daysInCurrentMonth : month=', monthNum, ' : days=', noOfDays);
			//
			return noOfDays;
		}
		
		//Exposing methods to outside world
		public function getUserSelectedDate():Date
		{
			return this.userDate;
		}
		
		
	}

}