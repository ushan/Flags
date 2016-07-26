package view
{

import model.navigation.NavigationEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

    public final class ApplicationMediator extends Mediator
    {

        [Inject]
        public var mainView:ApplicationBase;

        public function ApplicationMediator()
        {
            super();
        }

        override public function initialize():void
        {
            super.initialize();
            addContextListener(NavigationEvent.NAVIGATE_TO, context_navigateToHandler, NavigationEvent);
        }

        //----------------------------------------------------------------------
        //
        //	context handlers
        //
        //----------------------------------------------------------------------

        private function context_navigateToHandler(event:NavigationEvent):void
        {
            mainView.showScreen(event.screenName);
        }


    }
}
