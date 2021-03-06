/**
 * Created by Ushan on 26.07.2016.
 */
package view.screens {


import controller.SetCurrentCountrySignal;

import feathers.data.ListCollection;

import model.flags.CountriesModel;

import model.flags.CountryVO;

import model.flags.CountryVO;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

import view.themes.AssetsService;
import starling.textures.Texture;

public class CountrySelectorScreenMediator extends StarlingMediator{
	[Inject]
	public var view				:CountrySelectorScreen;

	[Inject]
	public var asset			:AssetsService;

	[Inject]
	public var countriesModel	:CountriesModel;

	[Inject]
	public var signal       	:SetCurrentCountrySignal;

	private var currentCountiesList:Vector.<CountryVO>;

	override public function initialize():void
	{
		super.initialize();
		view.filterChanged.add(filterChangedHandler);
		view.countrySelected.add(countrySelectedHandler);

		currentCountiesList = countriesModel.countries;
		view.initCountriesList(currentCountiesList);
	}

	override public function destroy():void
	{
		view.filterChanged.remove(filterChangedHandler);
		view.countrySelected.remove(countrySelectedHandler);
		super.destroy();
	}

	//----------------------------------------------------------------------
	//
	//	handlers
	//
	//----------------------------------------------------------------------

	private function filterChangedHandler():void
	{
		var filterString:String = view.filterString.toLowerCase();
		var filterFunction:Function = function(item:CountryVO, index:int, vector:Vector.<CountryVO>):Boolean {
			if (item.name.toLowerCase().indexOf(filterString) >= 0) return true
				else
					return false;
		};
		currentCountiesList = countriesModel.countries.filter(filterFunction, filterString);
		view.filterCounties(currentCountiesList);

	}

	private function countrySelectedHandler(index:int):void
	{

		var country:CountryVO = currentCountiesList[index];
		//trace(country.name);
		signal.dispatch(country);
	}




}
}
