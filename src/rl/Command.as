package rl
{
    import flash.events.Event;
    import flash.events.IEventDispatcher;

    import robotlegs.bender.extensions.commandCenter.api.ICommand;
    import robotlegs.bender.extensions.localEventMap.api.IEventMap;

    public class Command implements ICommand
    {

        [Inject]
        public var eventMap:IEventMap;

        [Inject]
        public var eventDispatcher:IEventDispatcher;

        public function execute():void
        {
        }

        protected function dispatch(event:Event):void
        {
            if(eventDispatcher.hasEventListener(event.type))
                eventDispatcher.dispatchEvent(event);
        }
    }
}
