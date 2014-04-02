package org.ranapat.bundles.examples 
{
	import org.ranapat.bundles.Bundle;
	
	/**
	 * ...
	 * @author ranapat
	 */
	public class BundleB extends Bundle 
	{
		
		public function BundleB() 
		{
			super();
		}
		
		override public function create():void {
			trace("created " + this)
		}
		
		override public function destroy():void {
			trace("destroyed " + this)
		}
		
		override public function start():void {
			super.start();
			
			trace("started " + this)
			this.meld("TestCommandBundleB", { parameter: "all the same", parameter1: "fuck it " + Math.random() })
		}
		
		override public function stop():void {
			super.stop();
			
			trace("stopped " + this)
		}
		
	}

}