package org.ranapat.bundles {
	
	public class Bundle {
		public static const CONTROL_MODE_AUTOMATIC:String = "automatic";
		public static const CONTROL_MODE_MANUAL:String = "manual";
		
		protected var _controlMode:String;
		private var _started:Boolean;
		
		public function Bundle() {
			Tools.ensureAbstractClass(this, Bundle);
			
			this._controlMode = Bundle.CONTROL_MODE_AUTOMATIC;
		}
		
		public function get controlMode():String {
			return this._controlMode;
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