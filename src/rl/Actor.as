package rl
{
    import flash.events.Event;
    import flash.events.IEventDispatcher;

    import robotlegs.bender.extensions.localEventMap.api.IEventMap;

    public class Actor
    {
        [Inject]
        public var eventMap:IEventMap;

        [Inject]
        public var eventDispatcher:IEventDispatcher;


        protected function dispatch(event:Event):void
        {
            if(eventDispatcher.hasEventListener(event.type))
                eventDispatcher.dispatchEvent(event);
        }
    }
}
