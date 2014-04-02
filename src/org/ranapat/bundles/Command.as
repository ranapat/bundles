package org.ranapat.bundles {
	
	public class Command {
		private var _name:String;
		private var _parameters:*;
		
		public function Command(_name:String = null, _parameters:* = null) {
			this._name = _name? _name : Tools.getFullClassName(this);
			this._parameters = _parameters;
		}
		
		public function get name():String {
			return this._name;
		}
		
		public function get shortName():String {
			return Tools.shortenClassName(this._name);
		}
		
		public function get(key:String):* {
			return (this as Object).hasOwnProperty(key)? this[key] : this._parameters && this._parameters[key]? this._parameters[key] : null;
		}
		
	}

}