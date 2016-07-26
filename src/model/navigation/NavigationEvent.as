package model.navigation
{
    import flash.events.Event;

    /**
     * This event used to navigate through app screens.
     * This is bubbling event.
     */
    public final class NavigationEvent extends Event
    {
        //----------------------------------------------------------------------
        //
        //	event types
        //
        //----------------------------------------------------------------------

        /**
         * Will switch the screen to one stored in <code>screenName</code> property.
         * If <code>allowGoBack</code> will be set to <code>true</code>, then previous screen name will be saved in navigation history.
         */
        public static const NAVIGATE_TO:String = "navigateTo";

        /**
         * Will switch to the previous screen.
         */
        public static const NAVIGATE_BACK:String = "navigateBack";

        /**
         * Will set screen in data model, but will not attempt to navigate to it.
         */
        public static const SET_SCREEN:String = "setScreen";

        /**
         * Clears the history.
         */
        public static const CLEAR:String = "clear";

        //----------------------------------------------------------------------
        //
        //	public fields
        //
        //----------------------------------------------------------------------

        /**
         * Screen to show.
         * @see #NAVIGATE_TO
         */
        public var screenName:String;
        /**
         * If true, then previous screenName will be saved in history, so it will be possible to go back.
         * @default false
         */
        public var allowGoBack:Boolean;

        //----------------------------------------------------------------------
        //
        //	constructor
        //
        //----------------------------------------------------------------------

        public function NavigationEvent(type:String)
        {
            super(type, true);
        }

        override public function clone():Event
        {
            var res:NavigationEvent = new NavigationEvent(type);
            res.screenName = screenName;
            res.allowGoBack = allowGoBack;
            return res;
        }

        //----------------------------------------------------------------------
        //
        //	factory methods
        //
        //----------------------------------------------------------------------

        /**
         * @see #CLEAR
         */
        public static function clear():NavigationEvent
        {
            return new NavigationEvent(NavigationEvent.CLEAR);
        }

        /**
         *
         * @param screenName
         * @param allowGoBack
         * @return
         * @see #NAVIGATE_TO
         */
        public static function navigateTo(screenName:String, allowGoBack:Boolean = false):NavigationEvent
        {
            var res:NavigationEvent = new NavigationEvent(NAVIGATE_TO);
            res.screenName = screenName;
            res.allowGoBack = allowGoBack;
            return res;
        }

        /**
         * @see #NAVIGATE_BACK
         */
        public static function navigateBack():NavigationEvent
        {
            return new NavigationEvent(NavigationEvent.NAVIGATE_BACK);
        }

        public static function setScreen(screenName:String, allowGoBack:Boolean = false):NavigationEvent
        {
            var res:NavigationEvent = new NavigationEvent(SET_SCREEN);
            res.screenName = screenName;
            res.allowGoBack = allowGoBack;
            return res;
        }
    }
}
