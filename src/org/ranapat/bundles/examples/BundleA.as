package org.ranapat.bundles.examples 
{
	import org.ranapat.bundles.Bundle;
	
	/**
	 * ...
	 * @author ranapat
	 */
	public class BundleA extends Bundle 
	{
		
		public function BundleA() 
		{
			super();
			
			this._controlMode = Bundle.CONTROL_MODE_MANUAL;
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
		}
		
		override public function stop():void {
			super.stop();
			
			trace("stopped " + this)
		}
		
	}

}