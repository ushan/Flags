/**
 * Created by Ushan on 26.07.2016.
 */
package model.flags {
import rl.Actor;

public class FlagsService extends Actor {
	//----------------------------------------------------------------------
	//
	//	read only
	//
	//----------------------------------------------------------------------

	public function get flags()	:Vector.<FlagVO>    { return _flags; }
	private var _flags			:Vector.<FlagVO> ;

	//----------------------------------------------------------------------
	//
	//	private fields
	//
	//----------------------------------------------------------------------
	private var url	:String;


	//----------------------------------------------------------------------
	//
	//	constructor
	//
	//----------------------------------------------------------------------

	public function FlagsService() {
		super();
	}

	//----------------------------------------------------------------------
	//
	//	public methods
	//
	//----------------------------------------------------------------------

	public function loadFlags(url:String):void
	{
		this.url = url;
	}
}
}
