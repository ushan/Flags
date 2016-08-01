/**
 * Created by Ushan on 01.08.2016.
 */
package controller {
import model.EScreenName;
import model.flags.CountriesModel;
import model.flags.CountryVO;

import rl.Command;

public class SetCurrentCountryCommand extends Command {
	[Inject]
	public var currentCountry   :CountryVO;

	[Inject]
	public var countriesModel   :CountriesModel;


	[Inject]
	public var navigateSignal    :NavigateSignal;

	override public function execute():void
	{
		super.execute();
		countriesModel.currentCountry = currentCountry;
		navigateSignal.dispatch(EScreenName.WELCOME_SCREEN);

	}
}
}
