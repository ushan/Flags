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
        [Inject]
        public var event    :NavigationEvent;

        [Inject]
        public var service  :NavigationService;

        override public function execute():void
        {
            super.execute();
            switch(event.type)
            {
                case NavigationEvent.NAVIGATE_TO:
                    //service.setCurrentScreen(event.screenName, event.allowGoBack);
                    break;

                case NavigationEvent.NAVIGATE_BACK:
                    //service.back();
                    break;

                case NavigationEvent.SET_SCREEN:
                    service.setCurrentScreen(event.screenName);
                    break;
            }
        }
    }
}
