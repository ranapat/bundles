package org.ranapat.bundles {
	import flash.events.EventDispatcher;
	
	[Event(name = "complete", type = "org.ranapat.bundles.MeshCompleteEvent")]
	internal class MeshSemaphore extends EventDispatcher {
		private static var _instance:MeshSemaphore;
		
		public static function get instance():MeshSemaphore {
			if (!MeshSemaphore._instance) {
				MeshSemaphore._instance = new MeshSemaphore();
			}
			return MeshSemaphore._instance;
		}
		
		public function MeshSemaphore() {
			super();
		}
	}

}