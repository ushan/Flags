package view {

import controller.LoadAssetsSignal;
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
/*
	[Inject]
	public var signal			:LoadAssetsSignal;*/

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


		applicationBase.engineInited.add(engineInitedHandler);
		navSignal.add(navigateToHandler)
	}

	//----------------------------------------------------------------------
	//
	//	context handlers
	//
	//----------------------------------------------------------------------


	private function engineInitedHandler():void
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
