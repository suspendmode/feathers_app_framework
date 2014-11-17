package feathers.app.view
{
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import feathers.controls.LayoutGroup;
	import feathers.core.FeathersControl;
	import feathers.core.IValidating;
	import feathers.skins.IStyleProvider;
	
	import starling.core.RenderSupport;
	import starling.display.DisplayObject;
	
	public class SkinnableFeathersControl extends FeathersControl implements IValidating
	{
		/**
		 * @private
		 */
		private static const HELPER_POINT:Point = new Point();
		
		/**
		 * @private
		 */
		private static const HELPER_MATRIX:Matrix = new Matrix();
		
		/**
		 * The default <code>IStyleProvider</code> for all <code>LayoutGroup</code>
		 * components.
		 *
		 * @default null
		 * @see feathers.core.FeathersControl#styleProvider
		 */
		public static var globalStyleProvider:IStyleProvider;
		
		/**
		 * Constructor.
		 */
		public function SkinnableFeathersControl()
		{
			super();
		}
		
		/**
		 * @private
		 */
		override protected function get defaultStyleProvider():IStyleProvider
		{
			return LayoutGroup.globalStyleProvider;
		}

		/**
		 * @private
		 */
		protected var originalBackgroundWidth:Number = NaN;
		
		/**
		 * @private
		 */
		protected var originalBackgroundHeight:Number = NaN;
		
		/**
		 * @private
		 */
		protected var currentBackgroundSkin:DisplayObject;
		
		/**
		 * @private
		 */
		protected var _backgroundSkin:DisplayObject;
		
		/**
		 * The default background to display behind all content. The background
		 * skin is resized to fill the full width and height of the layout
		 * group.
		 *
		 * <p>In the following example, the group is given a background skin:</p>
		 *
		 * <listing version="3.0">
		 * group.backgroundSkin = new Image( texture );</listing>
		 *
		 * @default null
		 */
		public function get backgroundSkin():DisplayObject
		{
			return this._backgroundSkin;
		}
		
		/**
		 * @private
		 */
		public function set backgroundSkin(value:DisplayObject):void
		{
			if(this._backgroundSkin == value)
			{
				return;
			}
			this._backgroundSkin = value;
			this.invalidate(INVALIDATION_FLAG_SKIN);
		}
		
		/**
		 * @private
		 */
		protected var _backgroundDisabledSkin:DisplayObject;
		
		/**
		 * The background to display behind all content when the layout group is
		 * disabled. The background skin is resized to fill the full width and
		 * height of the layout group.
		 *
		 * <p>In the following example, the group is given a background skin:</p>
		 *
		 * <listing version="3.0">
		 * group.backgroundDisabledSkin = new Image( texture );</listing>
		 *
		 * @default null
		 */
		public function get backgroundDisabledSkin():DisplayObject
		{
			return this._backgroundDisabledSkin;
		}
		
		/**
		 * @private
		 */
		public function set backgroundDisabledSkin(value:DisplayObject):void
		{
			if(this._backgroundDisabledSkin == value)
			{
				return;
			}
			this._backgroundDisabledSkin = value;
			this.invalidate(INVALIDATION_FLAG_SKIN);
		}
			
		/**
		 * @private
		 */
		override public function hitTest(localPoint:Point, forTouch:Boolean = false):DisplayObject
		{
			var localX:Number = localPoint.x;
			var localY:Number = localPoint.y;
			var result:DisplayObject = super.hitTest(localPoint, forTouch);
			if(result)
			{
				if(!this._isEnabled)
				{
					return this;
				}
				return result;
			}
			if(this.currentBackgroundSkin && this._hitArea.contains(localX, localY))
			{
				return this;
			}
			return null;
		}
		
		/**
		 * @private
		 */
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			if(this.currentBackgroundSkin && this.currentBackgroundSkin.hasVisibleArea)
			{
				var blendMode:String = this.blendMode;
				support.pushMatrix();
				support.transformMatrix(this.currentBackgroundSkin);
				support.blendMode = this.currentBackgroundSkin.blendMode;
				this.currentBackgroundSkin.render(support, parentAlpha * this.alpha);
				support.blendMode = blendMode;
				support.popMatrix();
			}
			super.render(support, parentAlpha);
		}
		
		/**
		 * @private
		 */
		override protected function draw():void
		{
			
			var skinInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SKIN);
			
			var stateInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STATE);
			
			var sizeInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SIZE);
			
			if(skinInvalid || stateInvalid || sizeInvalid)
			{
				this.refreshBackgroundSkin();
			}			
		}
		
		/**
		 * Choose the appropriate background skin based on the control's current
		 * state.
		 */
		protected function refreshBackgroundSkin():void
		{
			if(!this._isEnabled && this._backgroundDisabledSkin)
			{
				this.currentBackgroundSkin = this._backgroundDisabledSkin;
			}
			else
			{
				this.currentBackgroundSkin = this._backgroundSkin
			}
			if(this.currentBackgroundSkin)
			{
				if(this.originalBackgroundWidth !== this.originalBackgroundWidth ||
					this.originalBackgroundHeight !== this.originalBackgroundHeight) //isNaN
				{
					if(this.currentBackgroundSkin is IValidating)
					{
						IValidating(this.currentBackgroundSkin).validate();
					}
					this.originalBackgroundWidth = this.currentBackgroundSkin.width;
					this.originalBackgroundHeight = this.currentBackgroundSkin.height;
					
				}
			}
		}
	}
}