/**
 * Created by Ushan on 26.07.2016.
 */
package {
import feathers.controls.LayoutGroup;
import ApConfig;
import feathers.controls.StackScreenNavigator;
import feathers.examples.navigator.Main;

import flash.display.Sprite;

import flash.events.Event;

import robotlegs.bender.bundles.mvcs.MVCSBundle;

import robotlegs.bender.extensions.contextView.ContextView;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;
import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

import starling.core.Starling;

public class ApplicationBase extends Sprite {


	//----------------------------------------------------------------------
	//
	//	read only
	//
	//----------------------------------------------------------------------
	public function get main()	:Main { return _main}
	protected var _main			:Main;

	public function get navigator()	:StackScreenNavigator { return _main.navigator}

	//----------------------------------------------------------------------
	//
	//	protected fields
	//
	//----------------------------------------------------------------------

	protected var context			:IContext;
	protected var starling			:Starling;
	private var currentScreenName	:String;

	//----------------------------------------------------------------------
	//
	//	constructor
	//
	//----------------------------------------------------------------------
	public function ApplicationBase() {
		super();
		init();

	}

	private function init():void {
		updateSize();


	}

	public function showScreen(screenName:String):void
	{

		//navigator.getScreen("c");
		//navigator.pushScreen("c");
		navigator.pushScreen(screenName, null);
	}

	//----------------------------------------------------------------------
	//
	//	protected methods
	//
	//----------------------------------------------------------------------
	protected function initContext():void {
		context = new Context();
		context.install(MVCSBundle, StarlingViewMapExtension);
		context.configure(ApConfig, new ContextView(this), starling);
	}

	//----------------------------------------------------------------------
	//
	//	private methods
	//
	//----------------------------------------------------------------------


	private function finishScreenTransition():void
	{
	}


	private function updateSize():void
	{

	}

	//----------------------------------------------------------------------
	//
	//	event handlers
	//
	//----------------------------------------------------------------------

	private function addedToStageHandler(event:Event):void
	{
		removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		init();
	}

	private function stage_resizeHandler(event:Event):void
	{
		updateSize();
	}
}
}
