package feathers.app.view {
import feathers.core.FeathersControl;
import feathers.core.IValidating;

import starling.display.Quad;

public class QuadComponent extends FeathersControl {
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    private var quad:starling.display.Quad;

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    public function QuadComponent() {
        super();
		quad = new starling.display.Quad(1, 1, defaultColor, true);		
		addChild(quad);
    }

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var _disabledColor:uint = 0x00000;
	
	public function get disabledColor():uint {
		return _disabledColor;
	}
	
	public function set disabledColor(value:uint):void {
		if (_disabledColor == value)
			return;
		_disabledColor = value;
		invalidate(INVALIDATION_FLAG_STYLES);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private var _disabledAlpha:Number = 0.5;
	public function get disabledAlpha():Number {
		return _disabledAlpha;
	}
	
	public function set disabledAlpha(value:Number):void {
		if (_disabledAlpha == value)
			return;
		_disabledAlpha = value;
		invalidate(INVALIDATION_FLAG_STYLES);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    private var _defaultColor:uint = 0x00000;

    public function get defaultColor():uint {
        return _defaultColor;
    }

    public function set defaultColor(value:uint):void {
        if (_defaultColor == value)
            return;
        _defaultColor = value;
        invalidate(INVALIDATION_FLAG_STYLES);
    }

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    private var _defaultAlpha:Number = 1;
    public function get defaultAlpha():Number {
        return _defaultAlpha;
    }

    public function set defaultAlpha(value:Number):void {
        if (_defaultAlpha == value)
            return;
        _defaultAlpha = value;
        invalidate(INVALIDATION_FLAG_STYLES);
    }

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
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
			this.refreshQuad();
		}			
	}
	
	/**
	 * Choose the appropriate quad styles based on the control's current
	 * state.
	 */
	protected function refreshQuad():void
	{
		this.quad.color = isEnabled ? defaultColor: disabledColor;
		this.quad.alpha = isEnabled ? defaultAlpha: disabledAlpha;		
		
		this.quad.width = actualWidth;
		this.quad.height = actualHeight;			
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

}
}