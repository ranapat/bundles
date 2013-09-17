package org.ranapat.bundles {
	
	public class Bundle {
		private var _started:Boolean;
		
		public function Bundle() {
			Tools.ensureAbstractClass(this, Bundle);
		}
		
		public function get started():Boolean {
			return this._started;
		}
		
		public function create():void {
			//
		}
		
		public function destroy():void {
			//
		}
		
		public function stop():void {
			this._started = false;
		}
		
		public function start():void {
			this._started = true;
		}
	}

}