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

import starling.events.Event;

public class CountrySelectorScreen extends ScreenAbstract {
	public function CountrySelectorScreen() {
		super();
		this.title = "Select Your Country";
	}

	override protected function initialize():void
	{
		super.initialize();

		var layout:VerticalLayout = new VerticalLayout();
		layout.horizontalAlign = HorizontalAlign.CENTER;
		layout.verticalAlign = VerticalAlign.MIDDLE;
		layout.gap = 10;
		this.layout = layout;

		var popToB1Button:Button = new Button();
		popToB1Button.label = "Button1";
		popToB1Button.layoutData = new VerticalLayoutData(50);
		popToB1Button.addEventListener(Event.TRIGGERED, popToB1Button_triggeredHandler);
		this.addChild(popToB1Button);


	}

	protected function popToB1Button_triggeredHandler(event:Event):void
	{
		this.dispatchEventWith(Event.CANCEL);
	}
}
}
