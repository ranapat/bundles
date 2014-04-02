package org.ranapat.bundles {
	
	public class Command {
		private var __class:Class;
		private var __name:String;
		private var __parameters:*;
		
		public function Command(__name:String = null, __parameters:* = null) {
			this.__class = Tools.getClass(this);
			this.__name = __name? __name : Tools.getFullClassName(this);
			this.__parameters = __parameters;
		}
		
		public function get _class():Class {
			return this.__class;
		}
		
		public function get name():String {
			return this.__name;
		}
		
		public function get shortName():String {
			return Tools.shortenClassName(this.__name);
		}
		
		public function get(key:String):* {
			return (this as Object).hasOwnProperty(key)? this[key] : this.__parameters && this.__parameters[key]? this.__parameters[key] : null;
		}
		
	}

}