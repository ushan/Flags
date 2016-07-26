/**
 * Created by Ushan on 26.07.2016.
 */
package model {
import flash.events.Event;

public class LoadDataEvent extends Event {
	//----------------------------------------------------------------------
	//
	//	event types
	//
	//----------------------------------------------------------------------


	public static const DATA_LOADED		:String = "dataLoaded";




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
	public function LoadDataEvent(type:String) {
		super(type, true);
	}

	/**
	 *
	 */
	public static function dataLoaded():LoadDataEvent
	{
		var res:LoadDataEvent = new LoadDataEvent(DATA_LOADED);
		return res;
	}
}
}
