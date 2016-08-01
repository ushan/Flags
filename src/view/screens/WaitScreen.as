package view.screens
{
	import feathers.controls.Button;
	import feathers.controls.PanelScreen;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.layout.VerticalLayout;
	import feathers.layout.VerticalLayoutData;

	import starling.events.Event;

	/**
	 * A wait image here from embed
	 */
	[Event(name="complete",type="starling.events.Event")]

	public class WaitScreen extends PanelScreen
	{
		public function WaitScreen()
		{
			super();
			this.title = "";
		}

		override protected function initialize():void
		{
			super.initialize();
		}

		protected function pushB1Button_triggeredHandler(event:Event):void
		{
			this.dispatchEventWith(Event.COMPLETE);
		}
	}
}
