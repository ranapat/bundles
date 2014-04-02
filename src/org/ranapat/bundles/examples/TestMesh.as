package org.ranapat.bundles.examples {
	import org.ranapat.bundles.Command;
	import org.ranapat.bundles.Mesh;
	
	public class TestMesh extends Mesh {
		
		public function TestMesh() {
			super();
			
			register(new BundleA(), "a");
			register(new BundleB(), "b");
			
			set("a");
			set("a");
			set("b");
			set("a");
			set("a");
			set("c");
			
			//unregisterAll();
			
			unregister("a");
			unregister("b");
			
			set("a");
			set("b");
		}
		
		override protected function announced(command:Command):void {
			super.announced(command);
			
			trace("announced " + command + " .. " + command.name + " .. " + command.get("parameter") + " .. " + command.get("parameter1"))
		}
		
	}

}