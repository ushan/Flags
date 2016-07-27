/**
 * Created by Ushan on 27.07.2016.
 */
package controller {
import org.osflash.signals.Signal;

public class NavigateSignal extends Signal {



	public var screenName:String;
	//----------------------------------------------------------------------
	//
	//	constructor
	//
	//----------------------------------------------------------------------

	/**
	 * Screen name.
	 */
	public function NavigateSignal() {
		super(String);
		//this.screenName = screenName;
	}
}
}
