package view {

import controller.NavigateSignal;
import controller.StartupSignal;

import events.RobotLegsEvent;

import flash.events.IEventDispatcher;

import model.EScreenName;

import model.navigation.NavigationEvent;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.framework.impl.Context;

public final class ApplicationMediator extends Mediator {

	[Inject]
	public var applicationBase	:ApplicationBase;

	[Inject]
	public var signal			:StartupSignal;

	[Inject]
	public var navSignal		:NavigateSignal;
	/*

	 [Inject]
	 public var dispatcher	:IEventDispatcher;*/

	public function ApplicationMediator()
	{
		super();
	}

	override public function initialize():void
	{
		super.initialize();
		addContextListener(NavigationEvent.NAVIGATE_TO, context_navigateToHandler, NavigationEvent);


		applicationBase.uiCreated.add(startGameSignalHandler);
		navSignal.add(navigateToHandler)
	}

	//----------------------------------------------------------------------
	//
	//	context handlers
	//
	//----------------------------------------------------------------------

	private function context_navigateToHandler(event:NavigationEvent):void
	{
		applicationBase.showScreen(event.screenName);
	}

	private function startGameSignalHandler():void
	{
		//eventDispatcher.dispatchEvent(RobotLegsEvent.startupComplete());
		signal.dispatch();
	}
	private function navigateToHandler(screenName:String):void
	{
		//eventDispatcher.dispatchEvent(RobotLegsEvent.startupComplete());
		applicationBase.showScreen(screenName);
	}


}
}
