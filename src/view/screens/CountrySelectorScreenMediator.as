/**
 * Created by Ushan on 26.07.2016.
 */
package view.screens {


import feathers.data.ListCollection;

import model.flags.CountryVO;

import model.flags.CountryVO;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

import view.themes.AssetsService;
import starling.textures.Texture;

public class CountrySelectorScreenMediator extends StarlingMediator{
	[Inject]
	public var view	:CountrySelectorScreen;

	[Inject]
	public var asset	:AssetsService;

	override public function initialize():void
	{
		super.initialize();
		view.filterChanged.add(filterChangedHandler);

		//var texture:Texture = asset.getFlagTexture("ua");
		//var texture:Texture = asset.getTexture("ai.png0002");
		//var countriesList:ListCollection = new ListCollection();
		view.initCountriesList(asset.countries);
	}



	private function filterChangedHandler():void
	{
		var filterString:String = view.filterString
		var filterFunction:Function = function(item:CountryVO, index:int, vector:Vector.<CountryVO>):Boolean {
			if (item.name.indexOf(filterString) >= 0) return true
				else
					return false;
		};
		var filteredCountries:Vector.<CountryVO> = asset.countries.filter(filterFunction, filterString);
		view.filterCounties(filteredCountries);

	}




}
}
