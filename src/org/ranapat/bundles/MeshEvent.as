package org.ranapat.bundles {
	import flash.events.Event;
	
	public class MeshEvent extends Event {
		public static const COMPLETE:String = "MeshEvent::complete";
		public static const FAILED:String = "MeshEvent::failed";
		
		public var mesh:Mesh;
		
		public function MeshEvent(type:String, mesh:Mesh) {
			super(type);
			
			this.mesh = mesh;
		}
		
	}

}