package org.ranapat.bundles.examples
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.ranapat.bundles.Mesh;
	
	/**
	 * ...
	 * @author ranapat
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var m:Mesh = new Mesh();
			m.register("a", new BundleA());
			m.register("b", new BundleB());
			
			m.set("a");
			m.set("a");
			m.set("b");
			m.set("a");
			m.set("a");
			m.set("c");
			
			m.unregister("a");
			m.unregister("b");
			
			m.set("a");
			m.set("b");
		}
		
	}
	
}