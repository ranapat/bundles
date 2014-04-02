package org.ranapat.bundles {
	
	public class MeshJuggler {
		public function MeshJuggler() {
			this.addEventListener();
			
			this.initialize();
		}
		
		protected function initialize():void {
			//
		}
		
		protected function handleMeshComplete(e:MeshEvent):void {
			//trace("mesh is complete.... " + e.mesh);
		}
		
		protected function handleMeshFailed(e:MeshEvent):void {
			//trace("mesh failed to complete.... " + e.mesh);
		}
		
		private function addEventListener():void {
			MeshSemaphore.instance.addEventListener(MeshEvent.COMPLETE, this.handleMeshComplete, false, 0, true);
			MeshSemaphore.instance.addEventListener(MeshEvent.FAILED, this.handleMeshFailed, false, 0, true);
		}
	}

}