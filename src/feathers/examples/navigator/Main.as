package feathers.examples.navigator
{
import feathers.controls.Button;
import feathers.controls.LayoutGroup;
	import feathers.controls.StackScreenNavigator;
	import feathers.controls.StackScreenNavigatorItem;
	import view.screens.WaitScreen;
	import feathers.motion.Fade;
	import feathers.motion.Slide;

import flash.filesystem.File;

import model.EScreenName;

import starling.events.Event;
import starling.utils.AssetManager;

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
			//new FlagsAppThemeWithAssetManager();

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



			var waitScreen:StackScreenNavigatorItem = new StackScreenNavigatorItem(WaitScreen);
			_navigator.addScreen(EScreenName.WAIT_SCREEN, waitScreen);


			var welcomeScreen:StackScreenNavigatorItem = new StackScreenNavigatorItem(WelcomeScreen);
			_navigator.addScreen(EScreenName.WELCOME_SCREEN, welcomeScreen);

			var countrySelectorScreen:StackScreenNavigatorItem = new StackScreenNavigatorItem(CountrySelectorScreen);
			_navigator.addScreen(EScreenName.COUNTRY_SELECTOR_SCREEN, countrySelectorScreen);

			_navigator.rootScreenID = EScreenName.WAIT_SCREEN;
			this.addChild(navigator);
		}
	}
}
