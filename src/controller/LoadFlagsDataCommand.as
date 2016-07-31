/**
 * Created by Ushan on 26.07.2016.
 */
package controller {
import model.EGlobalConstants;
import model.LoadDataEvent;
import model.flags.CountriesService;
import model.navigation.NavigationService;

import rl.Command;

public class LoadFlagsDataCommand extends Command {

/*	[Inject]
	public var event:LoadDataEvent;*/

	[Inject]
	public var flagsService			:CountriesService;

	[Inject]
	public var navigationService	:NavigationService;

	override public function execute():void
	{
		super.execute();
		flagsService.loadFlags(EGlobalConstants.FLAGS_URL);


	}


}
}
