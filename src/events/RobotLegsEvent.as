/**
 * Created by Ushan on 26.07.2016.
 */
package events
{
    import flash.events.Event;

    public final class RobotLegsEvent extends Event
    {

        //----------------------------------------------------------------------
        //
        //	event types
        //
        //----------------------------------------------------------------------

        public static const STARTUP_COMPLETE:String = "startupComplete";

        //----------------------------------------------------------------------
        //
        //	public fields
        //
        //----------------------------------------------------------------------

        //----------------------------------------------------------------------
        //
        //	constructor
        //
        //----------------------------------------------------------------------

        public function RobotLegsEvent(type:String)
        {
            super(type);
        }

        override public function clone():Event
        {
            var res:RobotLegsEvent = new RobotLegsEvent(type);
            return res;
        }

        //----------------------------------------------------------------------
        //
        //	factory methods
        //
        //----------------------------------------------------------------------

        public static function startupComplete():RobotLegsEvent
        {
            var res:RobotLegsEvent = new RobotLegsEvent(STARTUP_COMPLETE);
            return res;
        }

    }
}
