package feathers.app.view
{
	import starling.display.Quad;

	public class QuadBorder extends SkinnableFeathersControl
	{
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// border quads
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		protected var leftQuad:Quad=new Quad(1, 1, 0);
		protected var rightQuad:Quad=new Quad(1, 1, 0);
		protected var topQuad:Quad=new Quad(1, 1, 0);
		protected var bottomQuad:Quad=new Quad(1, 1, 0);

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// constructor
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public function QuadBorder()
		{
			super();
			this.isQuickHitAreaEnabled=true;

			addChild(leftQuad);
			addChild(rightQuad);
			addChild(topQuad);
			addChild(bottomQuad);

		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _fitBackgroundInBorder:Boolean=true;

		public function get fitBackgroundInBorder():Boolean
		{
			return _fitBackgroundInBorder;
		}

		public function set fitBackgroundInBorder(value:Boolean):void
		{
			if (_fitBackgroundInBorder == value)
			{
				return;
			}
			_fitBackgroundInBorder=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// thickness
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public function get border():Boolean
		{
			return topBorder;
		}

		public function set border(value:Boolean):void
		{
			topBorder=value;
			leftBorder=value;
			rightBorder=value;
			bottomBorder=value;
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _topBorder:Boolean=true;

		public function get topBorder():Boolean
		{
			return _topBorder;
		}

		public function set topBorder(value:Boolean):void
		{
			if (_topBorder == value)
			{
				return;
			}
			_topBorder=value;
			if (value)
			{
				addChild(topQuad);
				
			}
			else
			{
				removeChild(topQuad);
			}
				invalidate(INVALIDATION_FLAG_STYLES);
				invalidate(INVALIDATION_FLAG_LAYOUT);
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _leftBorder:Boolean=true;

		public function get leftBorder():Boolean
		{
			return _leftBorder;
		}

		public function set leftBorder(value:Boolean):void
		{
			if (_leftBorder == value)
			{
				return;
			}
			_leftBorder=value;
			if (value)
			{
				addChild(leftQuad);
	
			}
			else
			{
				removeChild(leftQuad);
			}
				invalidate(INVALIDATION_FLAG_STYLES);
				invalidate(INVALIDATION_FLAG_LAYOUT);
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _rightBorder:Boolean=true;

		public function get rightBorder():Boolean
		{
			return _rightBorder;
		}

		public function set rightBorder(value:Boolean):void
		{
			if (_rightBorder == value)
			{
				return;
			}
			_rightBorder=value;
			if (value)
			{
				addChild(rightQuad);
			}
			else
			{
				removeChild(rightQuad);
			}
				invalidate(INVALIDATION_FLAG_STYLES);
				invalidate(INVALIDATION_FLAG_LAYOUT);
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _bottomBorder:Boolean=true;

		public function get bottomBorder():Boolean
		{
			return _bottomBorder;
		}

		public function set bottomBorder(value:Boolean):void
		{
			if (_bottomBorder == value)
			{
				return;
			}
			_bottomBorder=value;
			if (value)
			{
				addChild(bottomQuad);
			}
			else
			{
				removeChild(bottomQuad);
			}
			invalidate(INVALIDATION_FLAG_STYLES);
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// thickness
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _horizontalLayout:Boolean=false;

		public function get horizontalLayout():Boolean
		{
			return _horizontalLayout;
		}

		public function set horizontalLayout(value:Boolean):void
		{
			if (_horizontalLayout == value)
			{
				return;
			}
			_horizontalLayout=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// thickness
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public function set thickness(value:Number):void
		{
			thicknessTop=value;
			thicknessBottom=value;
			thicknessLeft=value;
			thicknessRight=value;
		}

		public function get thickness():Number
		{
			return thicknessTop;
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _thicknessTop:Number=0;

		public function get thicknessTop():Number
		{
			return _thicknessTop;
		}

		public function set thicknessTop(value:Number):void
		{
			if (_thicknessTop == value)
			{
				return;
			}
			_thicknessTop=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _thicknessBottom:Number=0;

		public function get thicknessBottom():Number
		{
			return _thicknessBottom;
		}

		public function set thicknessBottom(value:Number):void
		{
			if (_thicknessBottom == value)
			{
				return;
			}
			_thicknessBottom=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _thicknessLeft:Number=0;

		public function get thicknessLeft():Number
		{
			return _thicknessLeft;
		}

		public function set thicknessLeft(value:Number):void
		{
			if (_thicknessLeft == value)
			{
				return;
			}
			_thicknessLeft=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _thicknessRight:Number=0;

		public function get thicknessRight():Number
		{
			return _thicknessRight;
		}

		public function set thicknessRight(value:Number):void
		{
			if (_thicknessRight == value)
			{
				return;
			}
			_thicknessRight=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// padding
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public function set padding(value:Number):void
		{
			paddingTop=value;
			paddingBottom=value;
			paddingLeft=value;
			paddingRight=value;
		}

		public function get padding():Number
		{
			return paddingTop;
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _paddingTop:Number=0;

		public function get paddingTop():Number
		{
			return _paddingTop;
		}

		public function set paddingTop(value:Number):void
		{
			if (_paddingTop == value)
			{
				return;
			}
			_paddingTop=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _paddingBottom:Number=0;

		public function get paddingBottom():Number
		{
			return _paddingBottom;
		}

		public function set paddingBottom(value:Number):void
		{
			if (_paddingBottom == value)
			{
				return;
			}
			_paddingBottom=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _paddingLeft:Number=0;

		public function get paddingLeft():Number
		{
			return _paddingLeft;
		}

		public function set paddingLeft(value:Number):void
		{
			if (_paddingLeft == value)
			{
				return;
			}
			_paddingLeft=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _paddingRight:Number=0;

		public function get paddingRight():Number
		{
			return _paddingRight;
		}

		public function set paddingRight(value:Number):void
		{
			if (_paddingRight == value)
			{
				return;
			}
			_paddingRight=value;
			invalidate(INVALIDATION_FLAG_LAYOUT);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// border color
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		public function get borderColor():uint
		{
			return borderTopColor;
		}

		public function set borderColor(value:uint):void
		{
			borderLeftColor=value;
			borderRightColor=value;
			borderTopColor=value;
			borderBottomColor=value;
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _borderLeftColor:uint;

		public function get borderLeftColor():uint
		{
			return _borderLeftColor;
		}

		public function set borderLeftColor(value:uint):void
		{
			if (_borderLeftColor == value)
			{
				return;
			}
			_borderLeftColor=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _borderRightColor:uint;

		public function get borderRightColor():uint
		{
			return _borderRightColor;
		}

		public function set borderRightColor(value:uint):void
		{
			if (_borderRightColor == value)
			{
				return;
			}
			_borderRightColor=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _borderTopColor:uint;

		public function get borderTopColor():uint
		{
			return _borderTopColor;
		}

		public function set borderTopColor(value:uint):void
		{
			if (_borderTopColor == value)
			{
				return;
			}
			_borderTopColor=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _borderBottomColor:uint;

		public function get borderBottomColor():uint
		{
			return _borderBottomColor;
		}

		public function set borderBottomColor(value:uint):void
		{
			if (_borderBottomColor == value)
			{
				return;
			}
			_borderBottomColor=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// border alpha
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

		public function get borderAlpha():Number
		{
			return borderAlphaTop;
		}

		public function set borderAlpha(value:Number):void
		{
			borderAlphaTop=value;
			borderAlphaLeft=value;
			borderAlphaRight=value;
			borderAlphaBottom=value;
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _borderAlphaLeft:Number=1;

		public function get borderAlphaLeft():Number
		{
			return _borderAlphaLeft;
		}

		public function set borderAlphaLeft(value:Number):void
		{
			if (_borderAlphaLeft == value)
				return;
			_borderAlphaLeft=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _borderAlphaRight:Number=1;

		public function get borderAlphaRight():Number
		{
			return _borderAlphaRight;
		}

		public function set borderAlphaRight(value:Number):void
		{
			if (_borderAlphaRight == value)
				return;
			_borderAlphaRight=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _borderAlphaTop:Number=1;

		public function get borderAlphaTop():Number
		{
			return _borderAlphaTop;
		}

		public function set borderAlphaTop(value:Number):void
		{
			if (_borderAlphaTop == value)
				return;
			_borderAlphaTop=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		private var _borderAlphaBottom:Number=1;

		public function get borderAlphaBottom():Number
		{
			return _borderAlphaBottom;
		}

		public function set borderAlphaBottom(value:Number):void
		{
			if (_borderAlphaBottom == value)
				return;
			_borderAlphaBottom=value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// draw
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		override protected function draw():void
		{

			super.draw();
			
			var layoutInvalid:Boolean=this.isInvalid(INVALIDATION_FLAG_LAYOUT);
			var stylesInvalid:Boolean=this.isInvalid(INVALIDATION_FLAG_STYLES);
			var sizeInvalid:Boolean=this.isInvalid(INVALIDATION_FLAG_SIZE);
			var skinInvalid:Boolean=this.isInvalid(INVALIDATION_FLAG_SKIN);
			var stateInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STATE);
			
			if (autoSizeIfNeeded() || layoutInvalid || sizeInvalid || skinInvalid || stateInvalid)
			{
					if (backgroundSkin)
					{
						if (fitBackgroundInBorder)
						{
							backgroundSkin.x=paddingLeft + thicknessLeft;
							backgroundSkin.y=paddingTop + thicknessTop;
							backgroundSkin.width=actualWidth - paddingLeft - paddingRight - thicknessLeft - thicknessRight;
							backgroundSkin.height=actualHeight - paddingTop - paddingBottom - thicknessTop - thicknessBottom;
						}
						else
						{
							backgroundSkin.x=paddingLeft;
							backgroundSkin.y=paddingTop;
							backgroundSkin.width=actualWidth - paddingLeft - paddingRight;
							backgroundSkin.height=actualHeight - paddingTop - paddingBottom;
						}
					}

					this.layout();
			}

			if (stylesInvalid)
			{

				this.leftQuad.color=borderLeftColor;
				this.leftQuad.alpha=borderAlphaLeft;

				this.rightQuad.color=borderRightColor;
				this.rightQuad.alpha=borderAlphaRight;

				this.topQuad.color=borderTopColor;
				this.topQuad.alpha=borderAlphaTop;

				this.bottomQuad.color=borderBottomColor;
				this.bottomQuad.alpha=borderAlphaBottom;
			}
			
			

		}

		private function layout():void
		{

			if (horizontalLayout)
			{

				leftQuad.x=paddingLeft;
				leftQuad.y=paddingTop + thicknessTop;
				leftQuad.width=thicknessLeft;
				leftQuad.height=actualHeight - paddingBottom - thicknessTop - thicknessBottom - paddingTop;

				topQuad.x=paddingLeft;
				topQuad.y=paddingTop;
				topQuad.width=actualWidth - paddingRight - paddingLeft;
				topQuad.height=thicknessTop;

				rightQuad.x=actualWidth - thicknessRight - paddingRight;
				rightQuad.y=paddingTop + thicknessTop;
				rightQuad.width=thicknessRight;
				rightQuad.height=actualHeight - paddingTop - paddingBottom - thicknessTop - thicknessBottom;

				bottomQuad.x=paddingLeft
				bottomQuad.y=actualHeight - thicknessBottom - paddingBottom;
				bottomQuad.width=actualWidth - paddingLeft - paddingRight;
				bottomQuad.height=thicknessBottom;
			}
			else
			{

				leftQuad.x=paddingLeft;
				leftQuad.y=paddingTop;
				leftQuad.width=thicknessLeft;
				leftQuad.height=actualHeight - paddingBottom - paddingTop;

				topQuad.x=thicknessLeft + paddingLeft;
				topQuad.y=paddingTop;
				topQuad.width=actualWidth - thicknessLeft - thicknessRight - paddingRight - paddingLeft;
				topQuad.height=thicknessTop;

				rightQuad.x=actualWidth - thicknessRight - paddingRight;
				rightQuad.y=paddingTop;
				rightQuad.width=thicknessRight;
				rightQuad.height=actualHeight - paddingTop - paddingBottom;

				bottomQuad.x=thicknessLeft + paddingLeft
				bottomQuad.y=actualHeight - thicknessBottom - paddingBottom;
				bottomQuad.width=actualWidth - thicknessLeft - thicknessRight - paddingLeft - paddingRight;
				bottomQuad.height=thicknessBottom;
			}
		}


		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		/**
		 * If the component's dimensions have not been set explicitly, it will
		 * measure its content and determine an ideal size for itself. If the
		 * <code>explicitWidth</code> or <code>explicitHeight</code> member
		 * variables are set, those value will be used without additional
		 * measurement. If one is set, but not the other, the dimension with the
		 * explicit value will not be measured, but the other non-explicit
		 * dimension will still need measurement.
		 *
		 * <p>Calls <code>setSizeInternal()</code> to set up the
		 * <code>actualWidth</code> and <code>actualHeight</code> member
		 * variables used for layout.</p>
		 *
		 * <p>Meant for internal use, and subclasses may override this function
		 * with a custom implementation.</p>
		 */
		protected function autoSizeIfNeeded():Boolean
		{
			var needsWidth:Boolean=this.explicitWidth !== this.explicitWidth; //isNaN
			var needsHeight:Boolean=this.explicitHeight !== this.explicitHeight; //isNaN
			
			if (!needsWidth && !needsHeight)
			{
				return false;
			}

			if (!this.currentBackgroundSkin)
			{
				return false;
			}

			var newWidth:Number=this.explicitWidth;
			
			if (needsWidth)
			{
					if (this.fitBackgroundInBorder)
					{
						newWidth=this.currentBackgroundSkin.width + this._paddingLeft + this._paddingRight+ thicknessLeft + thicknessRight;
					}
					else
					{
						newWidth=this.currentBackgroundSkin.width + this._paddingLeft + this._paddingRight;
					}
			}

			var newHeight:Number=this.explicitHeight;
			
			if (needsHeight)
			{				
					if (this.fitBackgroundInBorder)
					{
						newHeight=this.currentBackgroundSkin.height + this._paddingTop + this._paddingBottom+ thicknessTop + thicknessBottom;
					}
					else
					{
						newHeight=this.currentBackgroundSkin.height + this._paddingTop + this._paddingBottom;
					}
			}

			return this.setSizeInternal(newWidth, newHeight, false);
		}
	}
}
