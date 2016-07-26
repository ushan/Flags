package feathers.examples.navigator
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.StackScreenNavigator;
	import feathers.controls.StackScreenNavigatorItem;
	import feathers.examples.navigator.screens.ScreenA;
	import feathers.examples.navigator.screens.ScreenB1;
	import feathers.examples.navigator.screens.ScreenB2;
	import feathers.examples.navigator.screens.ScreenC;
	import feathers.motion.Fade;
	import feathers.motion.Slide;
	import feathers.themes.MetalWorksMobileTheme;
import feathers.themes.MinimalMobileTheme;

import model.EScreenName;

import starling.events.Event;

import view.screens.CountrySelectorScreen;

import view.screens.WelcomeScreen;

public class Main extends LayoutGroup
	{
		private static const SCREEN_A	:String = "a";
		private static const SCREEN_B1	:String = "b1";
		private static const SCREEN_B2	:String = "b2";
		private static const SCREEN_C	:String = "c";

		//----------------------------------------------------------------------
		//
		//	read only
		//
		//----------------------------------------------------------------------
		public function get navigator()		:StackScreenNavigator { return _navigator}
		private var _navigator				:StackScreenNavigator;

		public function get screens()		:Vector.<StackScreenNavigatorItem> { return _screens}
		private var _screens				:Vector.<StackScreenNavigatorItem>

		//----------------------------------------------------------------------
		//
		//	private fields
		//
		//----------------------------------------------------------------------

		//----------------------------------------------------------------------
		//
		//	constructor
		//
		//----------------------------------------------------------------------
		public function Main()
		{
			//new MinimalMobileTheme();
			new MetalWorksMobileTheme();
			super();
		}


		//----------------------------------------------------------------------
		//
		//	constructor
		//
		//----------------------------------------------------------------------
		override protected function initialize():void
		{
			_navigator = new StackScreenNavigator();
			_navigator.pushTransition = Slide.createSlideLeftTransition();
			_navigator.popTransition = Slide.createSlideRightTransition();


			var itemA:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenA);
			itemA.setScreenIDForPushEvent(Event.COMPLETE, SCREEN_B1);
			_navigator.addScreen(SCREEN_A, itemA);

			var itemB1:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenB1);
			itemB1.setScreenIDForPushEvent(Event.COMPLETE, SCREEN_C);
			itemB1.setScreenIDForReplaceEvent(Event.CHANGE, SCREEN_B2);
			itemB1.addPopEvent(Event.CANCEL);
			_navigator.addScreen(SCREEN_B1, itemB1);

			var itemB2:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenB2);
			itemB2.pushTransition = Fade.createFadeInTransition();
			itemB2.addPopEvent(Event.CANCEL);
			_navigator.addScreen(SCREEN_B2, itemB2);

			var itemC:StackScreenNavigatorItem = new StackScreenNavigatorItem(WelcomeScreen);
			itemC.addPopToRootEvent(Event.CLOSE);
			itemC.addPopEvent(Event.CANCEL);
			_navigator.addScreen(EScreenName.WELCOME_SCREEN, itemC);

			var itemD:StackScreenNavigatorItem = new StackScreenNavigatorItem(CountrySelectorScreen);
			itemD.addPopToRootEvent(Event.CLOSE);
			itemD.addPopEvent(Event.CANCEL);
			_navigator.addScreen(EScreenName.COUNTRY_SELECTOR_SCREEN, itemD);

			_navigator.rootScreenID = SCREEN_A;
			this.addChild(navigator);
		}
	}
}
