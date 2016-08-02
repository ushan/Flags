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
	}


	override protected function commitData():void
	{
		super.commitData();
		var countyVO:CountryVO = data as CountryVO;
		//defaultSkin.x = 30;
		//iconFunction
		var lg:LayoutGroup = new LayoutGroup();
		if (!iconLoader) return
		iconLoader.width = 50;
		iconLoader.scaleY = iconLoader.scaleX;
	}

	override protected function refreshFocusIndicator():void
	{
		super.refreshFocusIndicator();
		height += (height % 2);

	}



}
}
