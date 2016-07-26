/**
 * Created by Ushan on 26.07.2016.
 */
package {
import feathers.controls.LayoutGroup;
import ApConfig;

import flash.display.Sprite;

import flash.events.Event;

import robotlegs.bender.bundles.mvcs.MVCSBundle;

import robotlegs.bender.extensions.contextView.ContextView;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;

public class ApplicationBase extends Sprite {
	//----------------------------------------------------------------------
	//
	//	private fields
	//
	//----------------------------------------------------------------------

	protected var context:IContext;


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

		context = new Context();
		context.install(MVCSBundle);
		context.configure(ApConfig, new ContextView(this));
	}

	public function showScreen(screenName:String):void	{	}

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
