package extensions.st.mediators {
	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	/**
	 * @author jamieowen
	 */
	public class StarlingSubViewMediator extends StarlingMediator
	{
		public function StarlingSubViewMediator()
		{
			
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
