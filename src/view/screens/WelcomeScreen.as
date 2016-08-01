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
import flash.geom.Rectangle;

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
		flagImage.dispose();
		flagImage.source = url;
		//flagImage.lo
	}

	public function init(texture:Texture, url:String = null):void
	{
		if (url) {
			if (!flagImage)
			{
				flagImage = new ImageLoader();
				flagImage.source = url;
				var flagLayoutData:AnchorLayoutData = new AnchorLayoutData();
				flagLayoutData.top = 20;
				flagLayoutData.left = 20;
				flagLayoutData.right = 20;
				flagLayoutData.horizontalCenter = 0;
				flagImage.layoutData = flagLayoutData;
				//Starling.current.stage.stageWidth = event.width;
				addChild(flagImage);

				maskImage = new ImageSkin(texture);
				maskImage.scale9Grid = new flash.geom.Rectangle(64, 64, 180, 180);
				addChild(maskImage);
				flagImage.addEventListener(Event.COMPLETE, imageLoader_completeHandler);
			}
				else
			{
				updateFlag(url);
			}

			//setMaskPosition();

		}

		var pickCountryBtnLayoutData:AnchorLayoutData = new AnchorLayoutData();
		pickCountryBtnLayoutData.bottom = Starling.current.stage.stageHeight / 3;
		pickCountryBtnLayoutData.horizontalCenter = 0;

		pickCountryBtn = new Button();
		pickCountryBtn.label = "Pick your Country";
		pickCountryBtn.styleNameList.add(CustomAppTheme.CUSTOM_BUTTON);
		pickCountryBtn.layoutData = pickCountryBtnLayoutData;
		pickCountryBtn.addEventListener(Event.TRIGGERED, popToB1Button_triggeredHandler);
		this.addChild(pickCountryBtn);




	}

	override public function dispose():void
	{
		super.dispose();
		pickCountryBtn.styleNameList.remove(CustomAppTheme.CUSTOM_BUTTON);

		if (flagImage)
		{
			flagImage.removeEventListener(Event.COMPLETE, imageLoader_completeHandler);
			flagImage.dispose();
		}
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

	//----------------------------------------------------------------------
	//
	//	private methods
	//
	//----------------------------------------------------------------------

	private function initImageLoader():void
	{

	}
	private function setMaskPosition():void
	{
		removeChild(maskImage);
		addChild(maskImage);
		flagImage.validate();
		maskImage.x = flagImage.x - 1;
		maskImage.y = flagImage.y - 1;
		maskImage.width = flagImage.width + 2;
		maskImage.height = flagImage.height + 2;

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
