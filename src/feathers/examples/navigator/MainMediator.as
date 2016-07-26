/**
 * Created by Ushan on 26.07.2016.
 */
package feathers.examples.navigator {
import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

public class MainMediator extends StarlingMediator {
	public function MainMediator() {
		super();
	}


	override public function initialize():void
	{
		super.initialize();
		trace( this + ", " + "initialise()" );
	}

	override public function destroy():void
	{
		super.initialize();
		trace( this + ", " + "destroy()" );
	}
}
}
