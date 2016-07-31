/**
 * Created by Ushan on 29.07.2016.
 */
package view.themes {
import feathers.controls.Button;
import feathers.controls.ButtonState;
import feathers.controls.renderers.DefaultGroupedListItemRenderer;
import feathers.controls.renderers.DefaultListItemRenderer;
import feathers.controls.text.TextFieldTextRenderer;
import feathers.core.ITextRenderer;
import feathers.skins.ImageSkin;
import view.themes.FlagsAppThemeWithAssetManager;

import flash.text.TextFormat;
import flash.geom.Rectangle;

import starling.core.Starling;

import starling.display.Quad;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

import starling.utils.AssetManager;

public class CustomAppTheme extends FlagsAppThemeWithAssetManager {


	public static const CUSTOM_BUTTON					:String = "custom-button";
	public static const CUSTOM_ITEM_RENDERER			:String = "custom-item-renderer";

	protected static const FLAGS_ATLAS_NAME		:String = "flags_theme";
	protected static const MEDIA_ATLAS_NAME		:String = "flags";

	//protected static const FLAGS_BUTTON_SCALE9_GRID			:Rectangle = new Rectangle(4, 4, 1, 20);
	//protected static const FLAGS_BUTTON_SCALE9_GRID			:Rectangle = new Rectangle(8, 8, 2, 10);
	protected static const FLAGS_BUTTON_SCALE9_GRID			:Rectangle = new Rectangle(9, 9, 2, 10);
	protected static const FLAGS_PRIMARY_BACKGROUND_COLOR	:uint = 0xffffff;

	protected var flags_buttonUpSkinTexture				:Texture;
	protected var flags_buttonDownSkinTexture			:Texture;
	protected var flags_buttonDisabledSkinTexture		:Texture;

	protected var flags_itemRendererUpSkinTexture		:Texture;
	protected var flags_itemRendererSelectedSkinTexture	:Texture;


	protected var flagsAtlas		:TextureAtlas;
	public function CustomAppTheme(assetsBasePath:String = "./", assetManager:AssetManager = null)
	{

		super(assetsBasePath, assetManager);
	}

	protected function setFlagsButtonStyles( button:Button ):void
	{
		var skin:ImageSkin = new ImageSkin(flags_buttonUpSkinTexture);
		skin.setTextureForState(ButtonState.DOWN, 		flags_buttonDownSkinTexture);
		skin.setTextureForState(ButtonState.DISABLED, 	flags_buttonDisabledSkinTexture);

		skin.scale9Grid = FLAGS_BUTTON_SCALE9_GRID;
		skin.width = controlSize;
		skin.height = controlSize;
		button.defaultSkin = skin;
	}

/*	protected function setFlagsButtonStyles( button:Button ):void
 {
 var skin:ImageSkin = new ImageSkin(flags_itemRendererUpSkinTexture);
 //skin.setTextureForState(ButtonState.DOWN, 		flags_buttonDownSkinTexture);
 //skin.setTextureForState(ButtonState.DISABLED, 	flags_buttonDisabledSkinTexture);

 skin.scale9Grid = FLAGS_BUTTON_SCALE9_GRID;
 skin.width = controlSize;
 skin.height = controlSize;
 button.defaultSkin = skin;
 }*/

	protected function customMiddleItemRendererStyles(renderer:DefaultGroupedListItemRenderer):void
	{
		setInsetGroupedListItemRendererStyles(renderer, flags_itemRendererUpSkinTexture, flags_itemRendererSelectedSkinTexture, INSET_ITEM_RENDERER_MIDDLE_SCALE9_GRID);
	}

	override protected  function initializeTextureAtlas():void
	{
		super.initializeTextureAtlas();
		flagsAtlas = assetManager.getTextureAtlas(FLAGS_ATLAS_NAME);
	}

	override protected function initializeStyleProviders():void
	{
		super.initializeStyleProviders();

		getStyleProviderForClass(Button).setFunctionForStyleName(CUSTOM_BUTTON, setFlagsButtonStyles );
		getStyleProviderForClass(DefaultListItemRenderer).setFunctionForStyleName(CUSTOM_ITEM_RENDERER, customMiddleItemRendererStyles );
	}

	override protected function initializeTextures():void
	{
		super.initializeTextures();
		flags_buttonUpSkinTexture 				= flagsAtlas.getTexture("button-up-skin0001");
		flags_buttonDownSkinTexture 			= flagsAtlas.getTexture("button-down-skin0001");
		flags_buttonDisabledSkinTexture 		= flagsAtlas.getTexture("button-disabled-skin0001");

		flags_itemRendererUpSkinTexture 		= flagsAtlas.getTexture("item-renderer-up-skin0001");
		flags_itemRendererSelectedSkinTexture 	= flagsAtlas.getTexture("item-renderer-selected-up-skin0001");
	}

	override protected function initializeStage():void
	{
		Starling.current.stage.color 		= FLAGS_PRIMARY_BACKGROUND_COLOR;
		Starling.current.nativeStage.color 	= FLAGS_PRIMARY_BACKGROUND_COLOR;
	}

	override protected function loadAssets(assetsBasePath:String, assetManager:AssetManager):void
	{
		assetPaths = new <String>
				[
					"images/" + ATLAS_NAME + ".xml",
					"images/" + ATLAS_NAME + ".png",
					"images/" + FLAGS_ATLAS_NAME + ".xml",
					"images/" + FLAGS_ATLAS_NAME + ".png",
					"images/" + MEDIA_ATLAS_NAME + ".xml",
					"images/" + MEDIA_ATLAS_NAME + ".png"
				];

		super.loadAssets(assetsBasePath, assetManager);
/*		var oldScaleFactor:Number = -1;
		if(assetManager)
		{
			oldScaleFactor = assetManager.scaleFactor;
			assetManager.scaleFactor = ATLAS_SCALE_FACTOR;
		}
		else
		{
			assetManager = new AssetManager(ATLAS_SCALE_FACTOR);
		}
		this.assetManager = assetManager;
		//add a trailing slash, if needed
		if(assetsBasePath.lastIndexOf("/") != assetsBasePath.length - 1)
		{
			assetsBasePath += "/";
		}
		var assetPaths:Vector.<String> = this.assetPaths;
		var assetCount:int = assetPaths.length;
		for(var i:int = 0; i < assetCount; i++)
		{
			var asset:String = assetPaths[i];
			this.assetManager.enqueue(assetsBasePath + asset);
		}
		if(oldScaleFactor != -1)
		{
			//restore the old scale factor, just in case
			this.assetManager.scaleFactor = oldScaleFactor;
		}
		this.assetManager.loadQueue(assetManager_onProgress);*/
	}
}


}
