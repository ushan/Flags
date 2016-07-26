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

import starling.events.Event;

	public class Main extends LayoutGroup
	{
		private static const SCREEN_A:String = "a";
		private static const SCREEN_B1:String = "b1";
		private static const SCREEN_B2:String = "b2";
		private static const SCREEN_C:String = "c";

		public function Main()
		{
			new MinimalMobileTheme();
			super();
		}

		private var navigator:StackScreenNavigator;

		override protected function initialize():void
		{
			navigator = new StackScreenNavigator();
			navigator.pushTransition = Slide.createSlideLeftTransition();
			navigator.popTransition = Slide.createSlideRightTransition();


			var itemA:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenA);
			itemA.setScreenIDForPushEvent(Event.COMPLETE, SCREEN_B1);
			navigator.addScreen(SCREEN_A, itemA);

			var itemB1:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenB1);
			itemB1.setScreenIDForPushEvent(Event.COMPLETE, SCREEN_C);
			itemB1.setScreenIDForReplaceEvent(Event.CHANGE, SCREEN_B2);
			itemB1.addPopEvent(Event.CANCEL);
			navigator.addScreen(SCREEN_B1, itemB1);

			var itemB2:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenB2);
			itemB2.pushTransition = Fade.createFadeInTransition();
			itemB2.addPopEvent(Event.CANCEL);
			navigator.addScreen(SCREEN_B2, itemB2);

			var itemC:StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenC);
			itemC.addPopToRootEvent(Event.CLOSE);
			itemC.addPopEvent(Event.CANCEL);
			navigator.addScreen(SCREEN_C, itemC);

			navigator.rootScreenID = SCREEN_A;
			this.addChild(navigator);
		}
	}
}
