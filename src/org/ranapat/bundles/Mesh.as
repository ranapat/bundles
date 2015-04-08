package org.ranapat.bundles {
	import flash.utils.Dictionary;
	
	public class Mesh {
		private var dictionary:Dictionary;
		
		public function Mesh() {
			Tools.ensureAbstractClass(this, Mesh);
			
			this.dictionary = new Dictionary();
		}
		
		public function announce(command:Command):void {
			this.announced(command);
		}
		
		protected function announced(command:Command):void {
			//
		}
		
		protected function complete():void {
			this.unregisterAll();
			
			MeshSemaphore.instance.dispatchEvent(new MeshEvent(MeshEvent.COMPLETE, this));
		}
		
		protected function failed():void {
			this.unregisterAll();
			
			MeshSemaphore.instance.dispatchEvent(new MeshEvent(MeshEvent.FAILED, this));
		}
		
		protected function yell(parameters:*):void {
			MeshSemaphore.instance.dispatchEvent(new MeshEvent(MeshEvent.YELL, this, parameters));
		}
		
		protected function register(instance:Bundle, name:String = null, autoSet:Boolean = true):Boolean {
			var result:Boolean;
			
			name = name? name : this.generateUniqueBundleName();
			
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
		
		protected function unregisterAll(forceAll:Boolean = false):void {
			for (var i:String in this.dictionary) {
				if (forceAll || (this.dictionary[i] as Bundle).controlMode == Bundle.CONTROL_MODE_AUTOMATIC) {
					this.unregister(i);
				}
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
		
		protected function generateUniqueBundleName():String {
			return "anonymous." + Math.random() + "." + Math.random();
		}
	}

}