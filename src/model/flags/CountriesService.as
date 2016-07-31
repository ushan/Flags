/**
 * Created by Ushan on 26.07.2016.
 */
package model.flags {
import rl.Actor;

public class CountriesService extends Actor {
	//----------------------------------------------------------------------
	//
	//	read only
	//
	//----------------------------------------------------------------------

	public function get flags()	:Vector.<CountryVO>    { return _flags; }
	private var _flags			:Vector.<CountryVO> ;

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

	public function CountriesService() {
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
