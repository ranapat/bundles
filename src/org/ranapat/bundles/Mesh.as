package org.ranapat.bundles {
	import flash.utils.Dictionary;
	
	public class Mesh {
		private var dictionary:Dictionary;
		
		public function Mesh() {
			this.dictionary = new Dictionary();
		}
		
		protected function register(name:String, instance:Bundle, autoSet:Boolean = true):Boolean {
			var result:Boolean;
			
			if (!this.dictionary[name]) {
				this.dictionary[name] = instance;
				instance.link(this);
				instance.create();
				if (autoSet) {
					this.set(name);
				}
				
				result = true;
			}
			
			return result;
		}
		
		protected function unregister(name:String):Boolean {
			var result:Boolean;
			
			if (this.dictionary[name]) {
				var tmp:Bundle;
				
				tmp = this.dictionary[name] as Bundle;
				if (tmp.started) {
					tmp.stop();
				}
				tmp.destroy();
				
				tmp = null;
				this.dictionary[name] = null;
				delete this.dictionary[name];
				
				result = true;
			}
			
			return result;
		}
		
		protected function unregisterAll():void {
			for (var i:String in this.dictionary) {
				this.unregister(i);
			}
		}
		
		protected function set(name:String):Boolean {
			var result:Boolean;
			
			if (this.dictionary[name]) {
				var tmp:Bundle;
				
				tmp = this.dictionary[name] as Bundle;
				if (!tmp.started) {
					for (var i:String in this.dictionary) {
						tmp = this.dictionary[i] as Bundle;
						if (tmp.controlMode == Bundle.CONTROL_MODE_AUTOMATIC && tmp.started) {
							tmp.stop();
						}
					}
					
					tmp = this.dictionary[name] as Bundle;
					tmp.start();
				}
				
				result = true;
			}
			
			return result;
		}
		
		protected function unset(name:String):Boolean {
			var result:Boolean;
			
			if (this.dictionary[name]) {
				var tmp:Bundle;
				
				tmp = this.dictionary[name] as Bundle;
				if (tmp.started) {
					tmp.stop();
					
					result = true;
				}
			}
			
			return result;
		}
		
		public function announced(command:Command):void {
			//
		}
		
	}

}