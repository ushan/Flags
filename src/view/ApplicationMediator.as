package view
{

import events.RobotLegsEvent;

import flash.events.IEventDispatcher;

import model.navigation.NavigationEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

    public final class ApplicationMediator extends Mediator
    {

        [Inject]
        public var applicationBase:ApplicationBase;
/*

        [Inject]
        public var dispatcher	:IEventDispatcher;*/

        public function ApplicationMediator()
        {
            super();
        }

        override public function initialize():void
        {
            super.initialize();
            addContextListener(NavigationEvent.NAVIGATE_TO, context_navigateToHandler, NavigationEvent);

            applicationBase.uiCreated.add(startGameSignalHandler);
        }

        //----------------------------------------------------------------------
        //
        //	context handlers
        //
        //----------------------------------------------------------------------

        private function context_navigateToHandler(event:NavigationEvent):void
        {
            applicationBase.showScreen(event.screenName);
        }

        private function startGameSignalHandler():void
        {
            eventDispatcher.dispatchEvent(RobotLegsEvent.startupComplete());
        }


    }
}
