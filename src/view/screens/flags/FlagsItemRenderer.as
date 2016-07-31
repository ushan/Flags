/**
 * Created by Ushan on 30.07.2016.
 */
package view.screens.flags {

import feathers.controls.ImageLoader;

import feathers.controls.LayoutGroup;

import feathers.controls.renderers.DefaultListItemRenderer;
import feathers.controls.renderers.LayoutGroupListItemRenderer;
import feathers.layout.AnchorLayoutData;

import flash.display.DisplayObject;

import model.flags.CountryVO;

import starling.textures.Texture;

public class FlagsItemRenderer extends DefaultListItemRenderer {
	public function FlagsItemRenderer()
	{
		super();
	}

	//private var flagImage		:Image;
	private var flagTexture	:Texture;
	private var  countyVO:CountryVO;

	override protected function initialize():void
	{
		super.initialize();
		iconSourceField = "texture";
		paddingLeft = 40;
		//iconFunction = flagIcon;


	}

/*	private function flagIcon(item:Object):DisplayObject
	{
		trace(item);
		if (item == countyVO) return;
		return new DisplayObject();
	}*/

/*	renderer.iconFunction = function( item:Object ):DisplayObject
		* {
	   if(item in cachedIcons)
	    {
	        return cachedIcons[item];
	    }
	    var icon:Image = new Image( textureAtlas.getTexture( item.textureName ) );
	    cachedIcons[item] = icon;
	    return icon;
	}*/

	override protected function commitData():void
	{
		super.commitData();
		//trace(_data.text);
		var countyVO:CountryVO = data as CountryVO;
		//defaultSkin.x = 30;
		//iconFunction
		var lg:LayoutGroup = new LayoutGroup();
		if (!iconLoader) return
		iconLoader.width = 50;
		iconLoader.scaleY = iconLoader.scaleX;


/*		if (flagTexture == countyVO.texture) return
		if (!flagImage)
		{
			flagImage = new Image(_data.texture);
			flagImage.height = 30;
			flagImage.scaleX = flagImage.scaleY;
			flagImage.x = - 30;
			//flagImage.layoutData =  new AnchorLayoutData(0, 0, 0, 0);
			addChild(flagImage);
		}
		else
		{
			flagImage.texture = countyVO.texture;
		}
		flagTexture = countyVO.texture;*/



	}

}
}
