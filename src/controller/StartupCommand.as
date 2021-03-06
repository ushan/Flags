/**
 * Created by Ushan on 26.07.2016.
 */
package controller
{
    import eu.alebianco.robotlegs.utils.impl.SequenceMacro;


    public final class StartupCommand extends SequenceMacro
    {
        override public function prepare():void
        {
            atomic = false;
            add(LoadAssetsCommand);
            add(StartAppCommand);
        }
    }
}


import controller.NavigateSignal;

import model.EScreenName;

import model.flags.CountriesModel;
import model.flags.CountriesService;
import model.navigation.NavigationEvent;

import rl.Command;



class StartAppCommand extends Command
{

    [Inject]
    public var flagsModel   :CountriesModel;

    [Inject]
    public var flagsService :CountriesService;

    [Inject]
    public var signal       :NavigateSignal;

    override public function execute():void
    {

        //dispatch(NavigationEvent.navigateTo(EScreenName.WELCOME_SCREEN));
        signal.dispatch(EScreenName.WELCOME_SCREEN);

    }
}