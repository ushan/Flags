package extentions.st.views {
	import starling.display.Sprite;
	import starling.events.Event;

	import flash.utils.setTimeout;

	/**
	 * @author jamieowen
	 */
	public class StarlingContextView extends Sprite
	{
		public function StarlingContextView()
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, init );
		}
		
		private function init(event:Event = null):void
		{
			removeEventListener( Event.ADDED_TO_STAGE, init );
			
			// add a sprite to test sprite mediation
			var sprite:Sprite = new Sprite();
			addChild( sprite );
			
			// add the sub view..  ( should get two extentions.mediators - StarlingSpriteMediator and StarlingSubViewMediator )
			var subView:StarlingSubView = new StarlingSubView();
			addChild( subView );
			
			setTimeout( function():void
			{
				removeChild( subView );
			}, 1000 );
		}
	}
}
