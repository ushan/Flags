/**
 * Created by Ushan on 26.07.2016.
 */
package view.screens {

import controller.NavigateSignal;

import model.EScreenName;
import model.flags.CountriesModel;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.framework.impl.Context;
import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

import starling.textures.Texture;

import view.themes.AssetsService;

public class WelcomeScreenMediator extends StarlingMediator {


	[Inject]
	public var view			:WelcomeScreen;

	[Inject]
	public var signal       :NavigateSignal;

	[Inject]
	public var countriesModel:CountriesModel;

	[Inject]
	public var asset			:AssetsService;


	//----------------------------------------------------------------------
	//
	//	overrides
	//
	//----------------------------------------------------------------------

	override public function initialize():void
	{
		super.initialize();
		view.pickCountryPressed.add(pickCountryPressedHandler);
		countriesModel.changedSignal.add(countryChangedHandler);
		var maskTexture:Texture = asset.getTexture("RoundMask0000");
		var url:String = countriesModel.getCurrentFullSizeURL();
		view.init(maskTexture, url);
	}

	override public function destroy():void
	{
		view.pickCountryPressed.remove(pickCountryPressedHandler);
		countriesModel.changedSignal.remove(countryChangedHandler);
		super.destroy();
	}



	//----------------------------------------------------------------------
	//
	//	handlers
	//
	//----------------------------------------------------------------------

	private function pickCountryPressedHandler():void
	{
		signal.dispatch(EScreenName.COUNTRY_SELECTOR_SCREEN);
	}

	private function countryChangedHandler():void
	{
		var url:String = countriesModel.getCurrentFullSizeURL();
		view.updateFlag(url);
	}
}
}
