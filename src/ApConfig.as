/**
 * Created by Ushan on 26.07.2016.
 */
package {


import controller.NavigateSignal;
import controller.NavigationCommand;
import controller.StartupCommand;
import controller.StartupSignal;

import events.RobotLegsEvent;


import feathers.examples.navigator.Main;
import feathers.examples.navigator.MainMediator;

import flash.events.IEventDispatcher;

import model.flags.FlagsModel;

import model.flags.FlagsService;
import model.navigation.NavigationEvent;

import model.navigation.NavigationService;


import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.matching.TypeMatcher;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.extensions.viewProcessorMap.api.IViewProcessorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IInjector;

import starling.display.Stage;

import view.ApplicationBase;

import view.ApplicationMediator;
import view.screens.CountrySelectorScreen;
import view.screens.CountrySelectorScreenMediator;
import view.screens.WelcomeScreen;
import view.screens.WelcomeScreenMediator;


public class ApConfig implements IConfig {


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
/*
	[Inject]
	public var evtCommandMap	:IEventCommandMap;*/

	[Inject]
	public var commandMap		:ISignalCommandMap;

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
		commandMap.map(StartupSignal).toCommand(StartupCommand);
		commandMap.map(NavigateSignal).toCommand(NavigationCommand);



		//---------------
		// app
		//---------------


		//---------------
		// independent notification signals.
		//---------------

		//---------------
		// views
		//---------------
		//viewProcessorMap.mapMatcher(new TypeMatcher().allOf(ApplicationBase, Main, WelcomeScreen, CountrySelectorScreen)).toInjection();
		viewProcessorMap.map(ApplicationBase).toInjection();





		mediatorMap.map(ApplicationBase).toMediator(ApplicationMediator);
		mediatorMap.map(Main).toMediator(MainMediator);
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
		//eventDispatcher.dispatchEvent(RobotLegsEvent.startupComplete());
	}
}
}
