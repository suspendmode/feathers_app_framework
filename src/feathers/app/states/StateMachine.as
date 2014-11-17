package feathers.app.states
{
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;

	public class StateMachine
	{
		public var states:Dictionary=new Dictionary();

		public var currentState:State;
		
		public function addState(state:State, name: String = null):void
		{
			if (!name) {
				name = state.name;
			}
			if (name == null) {
				throw new IllegalOperationError("states must have names");
			}
			if (name in states) {
				throw new IllegalOperationError("state " + name + " already declared");
			}
			states[name] = state;
		}

		public function getState(name:String):State
		{
			if (name in states) {
			return states[name];
			} else {
				throw new IllegalOperationError("no state: " + name + " definded in " + this);
			}
		}

		public function setState(name:String):State
		{
			var state:State=getState(name);
			if (currentState)
			{
				if (currentState.exitFunction != null)
				{
					currentState.exitFunction();
				}
			}
			currentState = state;
			if (currentState.enterFunction != null)
			{
				currentState.enterFunction();				
			}
			return state;
		}
	}
}
