/**
 * Created by Ushan on 26.07.2016.
 */
package {


import controller.NavigationCommand;
import controller.StartupCommand;

import events.RobotLegsEvent;

import feathers.examples.navigator.Main;

import flash.events.IEventDispatcher;

import model.flags.FlagsModel;

import model.flags.FlagsService;
import model.navigation.NavigationEvent;

import model.navigation.NavigationService;


import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.matching.TypeMatcher;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.viewProcessorMap.api.IViewProcessorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IInjector;

import view.ApplicationMediator;
import view.screens.CountrySelectorScreen;
import view.screens.CountrySelectorScreenMediator;
import view.screens.WelcomeScreen;
import view.screens.WelcomeScreenMediator;


public class ApConfig implements IConfig {

/*	[Inject]
	public var injector:IInjector;

	[Inject]
	public var mediatorMap:IMediatorMap;

	[Inject]
	public var commandMap:IEventCommandMap;

	[Inject]
	public var contextView:ContextView;*/



	[Inject]
	public var context			:IContext;

	[Inject]
	public var viewProcessorMap	:IViewProcessorMap;

	[Inject]
	public var injector			:IInjector;

	[Inject]
	public var mediatorMap		:IMediatorMap;

	[Inject]
	public var contextView		:ContextView;

	[Inject]
	public var commandMap		:IEventCommandMap;

	[Inject]
	public var eventDispatcher	:IEventDispatcher;

	public function ApConfig() {
	}


	public function configure():void
	{
//            context.logLevel = LogLevel.FATAL;

		//signalCommandMap.mapSignalClass(showFlagSelected, LoadFlagsDataCommand);

		//---------------
		// commands
		//---------------

		commandMap.map(RobotLegsEvent.STARTUP_COMPLETE, RobotLegsEvent).toCommand(StartupCommand);

		commandMap.map(NavigationEvent.NAVIGATE_TO, NavigationEvent).toCommand(NavigationCommand);
		/*commandMap.map(NavigationEvent.NAVIGATE_BACK, NavigationEvent).toCommand(NavigationCommand);
		commandMap.map(NavigationEvent.SET_SCREEN, NavigationEvent).toCommand(NavigationCommand);*/


		//---------------
		// app
		//---------------


		//---------------
		// independent notification signals.
		//---------------

		//---------------
		// views
		//---------------
		viewProcessorMap.mapMatcher(new TypeMatcher().allOf(Main, WelcomeScreen, CountrySelectorScreen)).toInjection();
		//viewProcessorMap.map(ApplicationBase).toInjection();


		injector.map(Main).asSingleton();

		mediatorMap.map(ApplicationBase).toMediator(ApplicationMediator);
		mediatorMap.map(WelcomeScreen).toMediator(WelcomeScreenMediator);
		mediatorMap.map(CountrySelectorScreen).toMediator(CountrySelectorScreenMediator);


		//---------------
		// models
		//---------------

		injector.map(NavigationService).asSingleton();
		injector.map(FlagsService).asSingleton();
		injector.map(FlagsModel).asSingleton();

		//---------------
		// services
		//---------------

		// Start.
		context.afterInitializing(init);
	}

	private function init():void
	{
		eventDispatcher.dispatchEvent(RobotLegsEvent.startupComplete());
	}
}
}
