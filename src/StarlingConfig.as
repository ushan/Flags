package {
	import extentions.st.mediators.StarlingContextViewMediator;
	import extentions.st.mediators.StarlingStageMediator;
	import extentions.st.mediators.StarlingSubViewMediator;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import starling.display.Stage;

	import extentions.st.views.StarlingContextView;
	import extentions.st.views.StarlingSubView;

	/**
	 * @author jamieowen
	 */
	public class StarlingConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		public function configure() : void
		{
			mediatorMap.map( StarlingContextView ).toMediator(StarlingContextViewMediator);
			mediatorMap.map( Stage ).toMediator(StarlingStageMediator);
			mediatorMap.map( StarlingSubView ).toMediator(StarlingSubViewMediator);
		}
	}
}
