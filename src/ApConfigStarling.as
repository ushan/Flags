/**
 * Created by Ushan on 26.07.2016.
 */
package {


import controller.NavigationCommand;
import controller.StartupCommand;

import events.RobotLegsEvent;

import extensions.st.mediators.StarlingContextViewMediator;
import extensions.st.mediators.StarlingStageMediator;
import extensions.st.mediators.StarlingSubViewMediator;

import extensions.st.views.StarlingContextView;
import extensions.st.views.StarlingSubView;

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

import starling.display.Stage;

import view.ApplicationMediator;
import view.screens.CountrySelectorScreen;
import view.screens.CountrySelectorScreenMediator;
import view.screens.WelcomeScreen;
import view.screens.WelcomeScreenMediator;


public class ApConfigStarling implements IConfig {

	[Inject]
	public var mediatorMap:IMediatorMap;

	public function configure():void
	{
		mediatorMap.map( StarlingContextView ).toMediator(StarlingContextViewMediator);
		mediatorMap.map( Stage ).toMediator(StarlingStageMediator);
		mediatorMap.map( StarlingSubView ).toMediator(StarlingSubViewMediator);
	}

}
}
