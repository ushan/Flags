/**
 * Created by Ushan on 26.07.2016.
 */
package view {
import feathers.controls.LayoutGroup;
import ApConfig;
import feathers.controls.StackScreenNavigator;
import feathers.examples.navigator.Main;

import flash.display.Sprite;

import flash.events.Event;
import flash.filesystem.File;

import org.osflash.signals.Signal;

import robotlegs.bender.bundles.mvcs.MVCSBundle;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;
import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;

import starling.core.Starling;
import starling.utils.AssetManager;


public class ApplicationBase extends Sprite {
	//----------------------------------------------------------------------
	//
	//	signals
	//
	//----------------------------------------------------------------------

	public const engineInited	:Signal = new Signal();
	public const assetsLoaded	:Signal = new Signal();

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
	public function ApplicationBase()
	{
		super();

		init();

	}



	public function showScreen(screenName:String):void
	{

		_main.navigator.pushScreen(screenName, null);
	}

	//----------------------------------------------------------------------
	//
	//	protected methods
	//
	//----------------------------------------------------------------------
	protected function initContext():void {
		context = new Context();
		context.install(MVCSBundle, StarlingViewMapExtension, SignalCommandMapExtension);
		context.configure(ApConfig, new ContextView(this), starling);
	}

	protected function reportEngineCreated():void
	{
		engineInited.dispatch();
	}

	protected function initEngine():void { 	}
	protected function activate():void { 	}


	//----------------------------------------------------------------------
	//
	//	private methods
	//
	//----------------------------------------------------------------------

	private function init():void
	{
		addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

	}

	private function finishScreenTransition():void
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
		initEngine();
		//activate();
	}

}
}
