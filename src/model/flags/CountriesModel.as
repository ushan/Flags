/**
 * Created by Ushan on 26.07.2016.
 */
package model.flags {
import org.osflash.signals.Signal;

public class CountriesModel {
	public var changedSignal			:Signal = new Signal();
	public var countries				:Vector.<CountryVO>;
	public function CountriesModel() {
	}

	public function get currentCountry()		:CountryVO	{return _currentCountry;}
	private var _currentCountry					:CountryVO;
	public function set currentCountry(value	:CountryVO):void
	{
		_currentCountry = value;
		changedSignal.dispatch(value);
	}
}
}
