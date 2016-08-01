/**
 * Created by Ushan on 01.08.2016.
 */
package controller {
import model.flags.CountryVO;

import org.osflash.signals.Signal;

public class SetCurrentCountrySignal extends Signal {
	public function SetCurrentCountrySignal()
	{
		super(CountryVO);
	}
}
}
