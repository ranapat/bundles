package org.ranapat.bundles.examples {
	import org.ranapat.bundles.Command;
	
	public class TestCommand extends Command {
		public var parameter:String;
		
		public function TestCommand(parameter:String) {
			super();
			
			this.parameter = parameter;
		}
		
	}

}