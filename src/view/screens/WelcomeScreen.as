/**
 * Created by Ushan on 26.07.2016.
 */
package view.screens {
import feathers.controls.Button;
import feathers.controls.ImageLoader;
import feathers.controls.PanelScreen;
import feathers.controls.Screen;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.layout.HorizontalAlign;
import feathers.layout.VerticalAlign;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;
import feathers.skins.ImageSkin;

import flash.display.BitmapData;

import org.osflash.signals.Signal;

import starling.core.Starling;
import starling.display.Image;

import starling.events.Event;
import starling.textures.RenderTexture;
import starling.textures.Texture;

import view.themes.CustomAppTheme;

public class WelcomeScreen extends ScreenAbstract {

	//----------------------------------------------------------------------
	//
	//	signals
	//
	//----------------------------------------------------------------------

	public const pickCountryPressed		:Signal = new Signal();
	public var pickCountryBtn			:Button;

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
	private var flagImage	:ImageLoader;
	private var maskImage	:ImageSkin;

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
	//	public methods
	//
	//----------------------------------------------------------------------
	public function updateFlag(url:String):void
	{
		//flagImage.
		flagImage.source = url;
	}

	public function init(texture:Texture):void
	{
		flagImage = new ImageLoader();
		flagImage.source = "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png1000px/ua.png";
		var flagLayoutData:AnchorLayoutData = new AnchorLayoutData();
		flagLayoutData.top = 20;
		flagLayoutData.left = 20;
		flagLayoutData.right = 20;
		flagLayoutData.horizontalCenter = 0;
		flagImage.layoutData = flagLayoutData;
		//Starling.current.stage.stageWidth = event.width;
		addChild(flagImage);

		maskImage = new ImageSkin(texture);
		//addChild(maskImage);
		setMaskPosition();

		var pickCountryBtnLayoutData:AnchorLayoutData = new AnchorLayoutData();
		pickCountryBtnLayoutData.bottom = Starling.current.stage.stageHeight / 3;
		pickCountryBtnLayoutData.horizontalCenter = 0;

		pickCountryBtn = new Button();
		pickCountryBtn.label = "Pick your Country";
		pickCountryBtn.styleNameList.add(CustomAppTheme.CUSTOM_BUTTON);
		pickCountryBtn.layoutData = pickCountryBtnLayoutData;
		pickCountryBtn.addEventListener(Event.TRIGGERED, popToB1Button_triggeredHandler);
		this.addChild(pickCountryBtn);

		flagImage.addEventListener(Event.COMPLETE, imageLoader_completeHandler);


	}
	//----------------------------------------------------------------------
	//
	//	overrides
	//
	//----------------------------------------------------------------------

	override protected function initialize():void
	 {
		 super.initialize();

		 this.layout = new AnchorLayout();


	 }


	private function setMaskPosition():void
	{
		removeChild(maskImage);
		addChild(maskImage);
		flagImage.invalidate();
		maskImage.x = flagImage.x - 1;
		maskImage.y = flagImage.y - 1;
		maskImage.width = flagImage.width + 1;
		maskImage.height = flagImage.height + 1;

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

	 protected function imageLoader_completeHandler(event:Event):void
	 {
		 setMaskPosition();
	 }

}
}
