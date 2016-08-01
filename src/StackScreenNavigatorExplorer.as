package {
import feathers.examples.navigator.Main;
import feathers.examples.navigator.Main;
import feathers.utils.ScreenDensityScaleFactorManager;

import flash.display.Loader;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageOrientation;
import flash.display.StageScaleMode;
import flash.display3D.Context3DProfile;
import flash.display3D.Context3DRenderMode;
import flash.events.Event;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.geom.Rectangle;
import flash.system.Capabilities;
import flash.utils.ByteArray;

import starling.core.Starling;
import starling.events.Event;
import starling.utils.AssetManager;

import view.ApplicationBase;

[SWF(width="960", height="640", frameRate="60", backgroundColor="#ffffff")]
public class StackScreenNavigatorExplorer extends ApplicationBase {



	//----------------------------------------------------------------------
	//
	//	private vars
	//
	//----------------------------------------------------------------------
	private var scaler:ScreenDensityScaleFactorManager;
	private var launchImage:Loader;
	private var savedAutoOrients:Boolean;

	//----------------------------------------------------------------------
	//
	//	constructor
	//
	//----------------------------------------------------------------------

	public function StackScreenNavigatorExplorer()
	{
		super();
		if (stage) {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}
		mouseEnabled = mouseChildren = false;
		showLaunchImage();

		//initContext();
		//activateStarling();
	}

	//----------------------------------------------------------------------
	//
	//	public methods
	//
	//----------------------------------------------------------------------
	override public function showScreen(screenName:String):void
	{
		super.showScreen(screenName);

	}

	//----------------------------------------------------------------------
	//
	//	protected methods
	//
	//----------------------------------------------------------------------
	override protected function initEngine():void
	{
		activateStarling();
	}

	//----------------------------------------------------------------------
	//
	//	private methods
	//
	//----------------------------------------------------------------------

	private function showLaunchImage():void
	{
		var filePath:String;
		var isPortraitOnly:Boolean = false;
		if (Capabilities.manufacturer.indexOf("iOS") >= 0) {
			var isCurrentlyPortrait:Boolean = stage.orientation == StageOrientation.DEFAULT || stage.orientation == StageOrientation.UPSIDE_DOWN;
			if (Capabilities.screenResolutionX == 1242 && Capabilities.screenResolutionY == 2208) {
				//iphone 6 plus
				filePath = isCurrentlyPortrait ? "Default-414w-736h@3x.png" : "Default-414w-736h-Landscape@3x.png";
			}
			else if (Capabilities.screenResolutionX == 1536 && Capabilities.screenResolutionY == 2048) {
				//ipad retina
				filePath = isCurrentlyPortrait ? "Default-Portrait@2x.png" : "Default-Landscape@2x.png";
			}
			else if (Capabilities.screenResolutionX == 768 && Capabilities.screenResolutionY == 1024) {
				//ipad classic
				filePath = isCurrentlyPortrait ? "Default-Portrait.png" : "Default-Landscape.png";
			}
			else if (Capabilities.screenResolutionX == 750) {
				//iphone 6
				isPortraitOnly = true;
				filePath = "Default-375w-667h@2x.png";
			}
			else if (Capabilities.screenResolutionX == 640) {
				//iphone retina
				isPortraitOnly = true;
				if (Capabilities.screenResolutionY == 1136) {
					filePath = "Default-568h@2x.png";
				}
				else {
					filePath = "Default@2x.png";
				}
			}
			else if (Capabilities.screenResolutionX == 320) {
				//iphone classic
				isPortraitOnly = true;
				filePath = "Default.png";
			}
		}

		if (filePath) {
			var file:File = File.applicationDirectory.resolvePath(filePath);
			if (file.exists) {
				var bytes:ByteArray = new ByteArray();
				var stream:FileStream = new FileStream();
				stream.open(file, FileMode.READ);
				stream.readBytes(bytes, 0, stream.bytesAvailable);
				stream.close();
				launchImage = new Loader();
				launchImage.loadBytes(bytes);
				addChild(launchImage);
				savedAutoOrients = stage.autoOrients;
				stage.autoOrients = false;
				if (isPortraitOnly) {
					stage.setOrientation(StageOrientation.DEFAULT);
				}
			}
		}
	}

	private function activateStarling():void
	{
		Starling.multitouchEnabled = true;
		starling = new Starling(Main, stage, null, null, Context3DRenderMode.AUTO, Context3DProfile.BASELINE_EXTENDED);
		//starling = new Starling(Main, stage);
		starling.supportHighResolutions = true;
		starling.skipUnchangedFrames = true;
		starling.start();

		/*			if(launchImage)
		 {
		 starling.addEventListener("rootCreated", starling_rootCreatedHandler);
		 }*/
		starling.addEventListener("rootCreated", starling_rootCreatedHandler);

		scaler = new ScreenDensityScaleFactorManager(starling);
		stage.addEventListener(flash.events.Event.DEACTIVATE, stage_deactivateHandler, false, 0, true);

		initContext();

	}

	private function setupPreviewAndOrientation():void
	{
		if (launchImage) {
			removeChild(launchImage);
			launchImage.unloadAndStop(true);
			launchImage = null;
			stage.autoOrients = savedAutoOrients;
		}
	}

	private function initTheme():void
	{


	}


	//----------------------------------------------------------------------
	//
	//	eventHandlers
	//
	//----------------------------------------------------------------------


	private function starling_rootCreatedHandler(event:Object):void
	{
		initTheme();
		_main = event.currentTarget.root as Main;
		setupPreviewAndOrientation();
		reportEngineCreated();

	}

	private function stage_deactivateHandler(event:flash.events.Event):void
	{
		starling.stop(true);
		stage.addEventListener(flash.events.Event.ACTIVATE, stage_activateHandler, false, 0, true);
	}

	private function stage_activateHandler(event:flash.events.Event):void
	{
		stage.removeEventListener(flash.events.Event.ACTIVATE, stage_activateHandler);
		starling.start();
	}

}
}