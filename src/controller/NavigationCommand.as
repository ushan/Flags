/**
 * Created by Ushan on 26.07.2016.
 */
package controller
{

import model.navigation.NavigationEvent;
import model.navigation.NavigationService;


import robotlegs.bender.bundles.mvcs.Command;

public final class NavigationCommand extends Command
    {
/*        [Inject]
        public var event    :NavigationEvent;*/

        [Inject]
        public var signal   :NavigateSignal;

        [Inject]
        public var service  :NavigationService;

        [Inject]
        public var screen   :String;

        override public function execute():void
        {
            super.execute();
/*            switch(screen)
            {
                case NavigationEvent.NAVIGATE_TO:
                    break;


                case NavigationEvent.SET_SCREEN:
                    service.setCurrentScreen(screen);
                    break;
            }*/

            service.setCurrentScreen(screen);
        }
    }
}
