/**
 * Created by Ushan on 26.07.2016.
 */
package model.flags {
import org.osflash.signals.Signal;

public class CountriesModel {
	private static const FULL_SIZE_FLAG_URL_TEMPLATE:String = "https://raw.githubusercontent.com/hjnilsson/country-flags/master/png1000px/%countryPrefix%.png"

	public var changedSignal			:Signal = new Signal();

	public function get currentCountry()		:CountryVO	{return _currentCountry;}
	private var _currentCountry					:CountryVO;
	public function set currentCountry(value	:CountryVO):void
	{
		_currentCountry = value;
		changedSignal.dispatch(value);
	}

	public function get countries()			:Vector.<CountryVO>{	return _countries;}
	public function set countries(value		:Vector.<CountryVO>):void{	_countries = value;	}
	private var _countries					:Vector.<CountryVO>;

	public function getCurrentFullSizeURL():String
	{
		if (!_currentCountry) return null
		return FULL_SIZE_FLAG_URL_TEMPLATE.split("%countryPrefix%").join(_currentCountry.prefix.toLowerCase());
	}

}
}
