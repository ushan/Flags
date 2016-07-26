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
            add(StartAppCommand);
        }
    }
}


import model.EScreenName;

import model.flags.FlagsModel;
import model.UserVO;
import model.navigation.NavigationEvent;

import rl.Command;



class StartAppCommand extends Command
{

    [Inject]
    public var userModel:FlagsModel;

    override public function execute():void
    {

        dispatch(NavigationEvent.navigateTo(EScreenName.WELCOME_SCREEN));

    }
}