/**
 * Created by Ushan on 26.07.2016.
 */
package view.screens {
import feathers.controls.Button;
import feathers.controls.PanelScreen;
import feathers.controls.Screen;
import feathers.layout.HorizontalAlign;
import feathers.layout.VerticalAlign;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import org.osflash.signals.Signal;

import starling.events.Event;

import view.themes.CustomAppTheme;

public class WelcomeScreen extends ScreenAbstract {

	//----------------------------------------------------------------------
	//
	//	signals
	//
	//----------------------------------------------------------------------

	public const pickCountryPressed:Signal = new Signal();
	public var pickCountryBtn	:Button;

	//----------------------------------------------------------------------
	//
	//	public fields
	//
	//----------------------------------------------------------------------

	//----------------------------------------------------------------------
	//
	//	private fields
	//
	//----------------------------------------------------------------------

	//----------------------------------------------------------------------
	//
	//	constructor
	//
	//----------------------------------------------------------------------
	public function WelcomeScreen()
	{
		super();
		this.title = "Welcome";
	}
	//----------------------------------------------------------------------
	//
	//	overrides
	//
	//----------------------------------------------------------------------

	override protected function initialize():void
	 {
		 super.initialize();

		 var layout:VerticalLayout = new VerticalLayout();
		 layout.horizontalAlign = HorizontalAlign.CENTER;
		 layout.verticalAlign = VerticalAlign.MIDDLE;
		 layout.gap = 10;
		 this.layout = layout;

		 pickCountryBtn = new Button();
		 pickCountryBtn.label = "Pick your Country";
		 pickCountryBtn.styleNameList.add(CustomAppTheme.CUSTOM_BUTTON);
		 pickCountryBtn.layoutData = new VerticalLayoutData(50);
		 pickCountryBtn.addEventListener(Event.TRIGGERED, popToB1Button_triggeredHandler);
		 this.addChild(pickCountryBtn);


	 }

	//----------------------------------------------------------------------
	//
	//	event handlers
	//
	//----------------------------------------------------------------------

	 protected function popToB1Button_triggeredHandler(event:Event):void
	 {
		 pickCountryPressed.dispatch();
	 }

}
}
