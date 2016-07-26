/**
 * Created by Ushan on 26.07.2016.
 */
package controller {
import model.LoadDataEvent;
import model.flags.FlagsService;
import model.navigation.NavigationService;

import rl.Command;

public class LoadFlagsDataCommand extends Command {

	[Inject]
	public var event:LoadDataEvent;

	[Inject]
	public var flagsService:FlagsService;

	[Inject]
	public var navigationService:NavigationService;

	override public function execute():void
	{
		super.execute();
		switch(event.type)
		{
			case LoadDataEvent.DATA_LOADED:
				break;


			case LoadDataEvent.DATA_LOADED:
				//nav command
				break;
		}
	}


}
}
