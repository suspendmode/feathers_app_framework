package feathers.app.states
{
	public class State
	{
		public var name: String;
		
		public var enterFunction: Function;
		public var exitFunction: Function;
		
		public function State(name: String, enterFunction: Function = null, exitFunction: Function = null)
		{
			this.name = name;
			this.enterFunction = enterFunction;
			this.exitFunction = exitFunction;
		}
	}
}