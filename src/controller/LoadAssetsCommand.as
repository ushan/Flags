/**
 * Created by Ushan on 29.07.2016.
 */
package controller {
import eu.alebianco.robotlegs.utils.impl.AsyncCommand;


import view.themes.AssetsService;

public class LoadAssetsCommand  extends AsyncCommand{

	[Inject]
	public var service  :AssetsService;

	override public function execute():void
	{
		super.execute();
		trace(service);
		service.assetLoaded.add(assetLoadedHandler);
		service.loadAssets();
	}

	private function assetLoadedHandler():void
	{
		dispatchComplete(true);
	}
}
}
