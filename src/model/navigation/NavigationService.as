package model.navigation
{

import rl.Actor;


    public final class NavigationService extends Actor
    {

        //----------------------------------------------------------------------
        //
        //	public methods
        //
        //----------------------------------------------------------------------


        //----------------------------------------------------------------------
        //
        //	private fields
        //
        //----------------------------------------------------------------------

        public function get currentScreen():String    { return _currentScreen; }
        private var _currentScreen:String;

        //----------------------------------------------------------------------
        //
        //	constructor
        //
        //----------------------------------------------------------------------
        public function setCurrentScreen(value:String):void
        {
            if(_currentScreen == value)
                return;

            _currentScreen = value;
        }

    }
}