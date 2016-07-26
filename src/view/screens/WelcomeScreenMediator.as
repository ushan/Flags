/**
 * Created by Ushan on 26.07.2016.
 */
package view.screens {

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

public class WelcomeScreenMediator extends StarlingMediator {


	[Inject]
	public var view	:WelcomeScreen;

	public function WelcomeScreenMediator() {
		super();
	}

	//----------------------------------------------------------------------
	//
	//	overrides
	//
	//----------------------------------------------------------------------

	override public function initialize():void
	{
		super.initialize();
		trace(view);
	}

	override public function destroy():void
	{
		super.destroy();
	}
}
}
