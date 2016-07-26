package {
	import extensions.st.mediators.StarlingContextViewMediator;
	import extensions.st.mediators.StarlingStageMediator;
	import extensions.st.mediators.StarlingSubViewMediator;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import starling.display.Stage;

	import extensions.st.views.StarlingContextView;
	import extensions.st.views.StarlingSubView;

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
