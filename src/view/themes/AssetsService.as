/**
 * Created by Ushan on 29.07.2016.
 */
package view.themes {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.utils.Dictionary;

import model.EGlobalConstants;
import model.flags.CountriesModel;
import model.flags.CountryVO;

import starling.textures.Texture;

import view.themes.FlagsAppThemeWithAssetManager;

import flash.events.Event;
import flash.filesystem.File;

import org.osflash.signals.Signal;

import starling.events.Event;

import starling.utils.AssetManager;

public class AssetsService {

	[Embed(source="../../assets/misc/leftCorner.png")]
	protected static const LEFT_CORNER_CLASS:Class;


	[Inject]
	public var countriesModel   :CountriesModel;
	//----------------------------------------------------------------------
	//
	//	signals
	//
	//----------------------------------------------------------------------
	public const assetLoaded:Signal = new Signal();
	//----------------------------------------------------------------------
	//
	//	public fields
	//
	//----------------------------------------------------------------------
	//public var countries		:Vector.<CountryVO>;

	//----------------------------------------------------------------------
	//
	//	private fields
	//
	//----------------------------------------------------------------------


	private var defaultTheme	:FlagsAppThemeWithAssetManager;
	private var assets			:AssetManager = new AssetManager();

	//----------------------------------------------------------------------
	//
	//	public methods
	//
	//----------------------------------------------------------------------


	public function loadAssets():void
	{

		assets.enqueue(
				File.applicationDirectory.resolvePath("./assets/images"),
				File.applicationDirectory.resolvePath("./assets/fonts"),
				File.applicationDirectory.resolvePath("./assets/data")
		);


		defaultTheme =	new FlagsAppThemeWithAssetManager("./assets/", assets);

		assets.loadQueue(assetManager_onProgress);

		defaultTheme.addEventListener(flash.events.Event.COMPLETE, theme_completeHandler);
	}

	public function getFlagTexture(prefix:String):Texture
	{
		return assets.getTexture(prefix.toLowerCase() + ".png0000");
	}
	public function getTexture(name:String):Texture
	{
		return assets.getTexture(name);
	}

	//----------------------------------------------------------------------
	//
	//	private methods
	//
	//----------------------------------------------------------------------

	private function theme_completeHandler(event:starling.events.Event):void
	{
		trace("compete");
		assetLoaded.dispatch();
		defaultTheme.removeEventListener(flash.events.Event.COMPLETE, theme_completeHandler);
		saveCounties(assets.getObject(EGlobalConstants.COUNTRIES_OBJECT_NAME));


	}

	private function saveCounties(data:Object)
	{
		var countries:Vector.<CountryVO> = new <CountryVO>[];

		//for each(var c:Object in data)
		for	(var c:String in data)
		{
			trace(c, data[c]);
			var country:CountryVO = new CountryVO(c, data[c]);
			var texture:Texture = getFlagTexture(c);
			country.texture = texture;
			countries.push(country);

		}

		countriesModel.countries = countries;
	}

	private function assetManager_onProgress(progress:Number):void
	{
		if (progress < 1)
			return;
	}

	private function fixCorners():void
	{
		var bitmapData:BitmapData = (new LEFT_CORNER_CLASS() as Bitmap).bitmapData;
		var texture:Texture = getFlagTexture("ua");
		//texture

	}
}
}
