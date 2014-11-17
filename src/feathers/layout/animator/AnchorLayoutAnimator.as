package feathers.layout.animator
{
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.ILayoutDisplayObject;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;

	public class AnchorLayoutAnimator
	{
		public var target:ILayoutDisplayObject;

		public var dictionary:Dictionary=new Dictionary();

		public var currentState:AnchorLayoutData;
		public var currentStateName: String;
		
		public var isChangingState:Boolean=false;

		public var transitionState:AnchorLayoutData;

		public function AnchorLayoutAnimator(target:ILayoutDisplayObject)
		{
			this.target=target;
		}

		public function addState(name:String, state:AnchorLayoutData):void
		{
			dictionary[name]=state;
		}
		
		private function getStateName(state: AnchorLayoutData): String {
			for (var name: String in dictionary) {
				var value: AnchorLayoutData = dictionary[name];
				if (value == state) {
					return name;
				}
			}
			return null;
		}

		public function getState(name:String):AnchorLayoutData
		{
			if (name in dictionary)
			{
				return dictionary[name];
			}
			else
			{
				throw new IllegalOperationError("no state: " + name + " defined in " + this.target);
			}
		}

		public function removeState(name:String, state:AnchorLayoutData):void
		{
			delete dictionary[name];
		}

		private var tweens: Array = [];
		
		public function reset(): void {
			currentState = null;
			currentStateName = null;
		}
		
		public function applyState(name:String, onComplete:Function=null):void
		{
			var nextState:AnchorLayoutData=getState(name);			
			
			// exit when state in not changing
			
			if (currentState && currentStateName == name) {
				if (onComplete != null)
				{
					setTimeout(onComplete, 1);
				}
				return;
			}
						
			// apply next state function			
			var applyNextState:Function=function():void
			{				
				target.layoutData=nextState;
				currentState=nextState;
				
				
				if (onComplete != null)
				{
					setTimeout(onComplete, 1);
				}
			}

			// if no transition apply state
				
			currentStateName=name;
			
			if (currentState == null)
			{
				applyNextState();
				return;
			}

			StopTweens();

			tweens=createTransitionTweens(currentState, nextState);
			
			
			if (tweens.length == 0)
			{
				applyNextState();
				return;
			}
			
			playTweens(tweens, function():void
			{
				applyNextState();
			});
			
		}
		
		private function StopTweens():void
		{
	
			for (var i : int = 0 ; i < tweens.length; i++) {
				var tween: Tween = tweens[i];
				Starling.current.juggler.remove(tween);
				//tween.reset(tween.target, 0, tween.transition);
			}
			tweens = [];
		}
		
		private function playTweens(tweens:Array, onComplete:Function):void
		{
			for (var i:int=0; i < tweens.length; i++)
			{
				var tween:Tween=tweens[i];
				if (i == 0)
				{
					tween.onComplete=onComplete;
				}
				Starling.current.juggler.add(tween);
			}
		}

		public var transitionDuration:Number=0.5;
		public var transitionEase:String=Transitions.EASE_OUT;

		private function createTransitionTweens(currentState:AnchorLayoutData, nextState:AnchorLayoutData):Array
		{
			transitionState=copy(currentState);
			target.layoutData=transitionState;

			var tweens:Array=[];

			var properties:Array=["percentWidth", "percentHeight", "left", "top", "bottom", "right", "verticalCenter", "horizontalCenter",]

			for (var i:int=0; i < properties.length; i++)
			{
				var property:String=properties[i];
				var sourceValue:Number=transitionState[property];
				var destinationValue:Number=nextState[property];
				if (isNaN(sourceValue))
				{
					continue;
				}
				if (isNaN(destinationValue))
				{
					continue;
				}
				if (sourceValue == destinationValue)
				{
					continue;
				}

				var propertyTween:Tween=new Tween(transitionState, transitionDuration, transitionEase);
				propertyTween.animate(property, destinationValue);
				tweens.push(propertyTween);
			}

			return tweens;
		}

		public function copy(source:AnchorLayoutData):AnchorLayoutData
		{
			var data:AnchorLayoutData=new AnchorLayoutData();

			// percent
			data.percentWidth=source.percentWidth;
			data.percentHeight=source.percentHeight;

			// left
			data.left=source.left;
			data.leftAnchorDisplayObject=source.leftAnchorDisplayObject;

			// right
			data.right=source.right;
			data.rightAnchorDisplayObject=source.rightAnchorDisplayObject;

			// top
			data.top=source.top;
			data.topAnchorDisplayObject=source.topAnchorDisplayObject;

			// bottom
			data.bottom=source.bottom;
			data.bottomAnchorDisplayObject=source.bottomAnchorDisplayObject;

			// vertical center
			data.verticalCenter=source.verticalCenter;
			data.verticalCenterAnchorDisplayObject=source.verticalCenterAnchorDisplayObject;

			// horizontal center
			data.horizontalCenter=source.horizontalCenter;
			data.horizontalCenterAnchorDisplayObject=source.horizontalCenterAnchorDisplayObject;

			return data;
		}
	}
}
