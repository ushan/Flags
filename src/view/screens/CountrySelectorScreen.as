/**
 * Created by Ushan on 26.07.2016.
 */
package view.screens {
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.List;
import feathers.controls.PanelScreen;
import feathers.controls.Screen;
import feathers.controls.TextInput;
import feathers.controls.renderers.DefaultListItemRenderer;
import feathers.controls.renderers.IListItemRenderer;
import feathers.data.ListCollection;
import feathers.events.FeathersEventType;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.layout.HorizontalAlign;
import feathers.layout.VerticalAlign;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;
import feathers.system.DeviceCapabilities;

import model.flags.CountryVO;

import org.osflash.signals.Signal;

import starling.core.Starling;
import starling.display.Image;

import starling.events.Event;
import starling.textures.Texture;

import view.screens.flags.FlagsItemRenderer;

import view.themes.CustomAppTheme;

public class CountrySelectorScreen extends ScreenAbstract {
	public const filterChanged		:Signal = new Signal();
	public const countrySelected	:Signal = new Signal();
	public var filterString			:String;

	private var _list	:List;
	private var _input	:TextInput;
	public function CountrySelectorScreen()
	{
		super();
		title = "Select Your Country";
	}

	public function filterCounties(countries:Vector.<CountryVO>):void
	{
		_list.dataProvider = new ListCollection(countries);

	}

	public function initCountriesList(countries:Vector.<CountryVO>):void
	{

		_list = new List();
		_list.dataProvider = new ListCollection(countries);
		//_list.typicalItem = {text: "Item 1000"};
		_list.isSelectable = true;
		_list.allowMultipleSelection = false;
		_list.hasElasticEdges = true;
		_list.clipContent = false;
		_list.autoHideBackground = true;
		_list.itemRendererFactory = function():IListItemRenderer
		{
			var renderer:FlagsItemRenderer = new FlagsItemRenderer();

			renderer.isQuickHitAreaEnabled = true;

			renderer.labelField = "text";

			renderer.styleNameList.add(CustomAppTheme.CUSTOM_ITEM_RENDERER);
			return renderer;
		};
		_list.addEventListener(Event.CHANGE, list_changeHandler);
		_list.layoutData = new AnchorLayoutData(30, 0, 0, 0);
		addChild(_list);

		_input = new TextInput();
		_input.prompt = "Type Your Country";
		_input.layoutData =  new AnchorLayoutData(0, 0, NaN, 0);
		addChild(_input);

		_input.addEventListener(Event.CHANGE, input_enterHandler);


	}

	override protected function initialize():void
	{
		super.initialize();

		this.layout = new AnchorLayout();

		if(!DeviceCapabilities.isTablet(Starling.current.nativeStage))
		{
			backButtonHandler = onBackButton;
		}

		addEventListener(FeathersEventType.TRANSITION_IN_COMPLETE, transitionInCompleteHandler);

	}


	override public function dispose():void
	{
		super.dispose();
	}

	//----------------------------------------------------------------------
	//
	//	event handlers
	//
	//----------------------------------------------------------------------

	private function input_enterHandler(FeathersEventType)
	{
		filterString = _input.text;
		filterChanged.dispatch();
	}


	private function onBackButton():void
	{
		dispatchEventWith(Event.COMPLETE);
	}

	private function transitionInCompleteHandler(event:Event):void
	{
		_list.revealScrollBars();

	}



	private function list_changeHandler(event:Event):void
	{
		countrySelected.dispatch(_list.selectedIndex);
	}
}
}
