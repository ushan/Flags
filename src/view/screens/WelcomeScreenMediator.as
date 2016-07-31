/**
 * Created by Ushan on 26.07.2016.
 */
package view.screens {

import controller.NavigateSignal;

import model.EScreenName;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

import starling.textures.Texture;

import view.themes.AssetsService;

public class WelcomeScreenMediator extends StarlingMediator {


	[Inject]
	public var view	:WelcomeScreen;



	[Inject]
	public var signal       :NavigateSignal;

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
		view.pickCountryPressed.add(pickCountryPressedHandler);
	}

	override public function destroy():void
	{
		super.destroy();
	}

	private function pickCountryPressedHandler():void
	{
		signal.dispatch(EScreenName.COUNTRY_SELECTOR_SCREEN);
	}
}
}
