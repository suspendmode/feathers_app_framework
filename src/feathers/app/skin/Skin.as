/**
 * Copyright (c) 2013, Digital Touch sp. z o.o.
 * All rights reserved.
 *
 * Any use, copying, modification, distribution and selling of this source code and it's documentation
 * for any purposes without authors' written permission is hereby prohibited.
 */
package feathers.app.skin {
import flash.errors.IllegalOperationError;
import flash.geom.Rectangle;

import feathers.app.view.QuadBorder;
import feathers.app.view.fonts.IFontManager;
import feathers.controls.ImageLoader;
import feathers.core.DisplayListWatcher;
import feathers.display.Scale3Image;
import feathers.display.Scale9Image;
import feathers.textures.Scale3Textures;
import feathers.textures.Scale9Textures;

import logger.Logger;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.Quad;
import starling.textures.Texture;
import starling.utils.AssetManager;

import utils.ScreenScale;

/**
 *
 * @author developer
 *
 */
public class Skin extends DisplayListWatcher {

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	[Inject]
	public var injector:AssetManager;
	
	[Inject]
	public var assetManager:AssetManager;
	
	[Inject]
	public var fontManager:IFontManager;
	
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * helpers
     */
    public static const DISABLED_ALPHA:Number = 0.5;
    public static const ENABLED_ALPHA:Number = 1;

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    public function scale(value:Number):Number {
        return value * screenScale.scale;
    }

    [Inject]
    /**
     * screen scale
     */
    public var screenScale:ScreenScale;

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * abstract class for skins
     */
    public function Skin() {
        super(Starling.current.stage);
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    [PostConstruct]
    /**
     *
     * initialize
     *
     */
    public final function initialize():void {
		config::debug {
			Logger.log("{0}->initialize", this);
		}
        initializeSkin();
        initializeObject(root);
    }

    /**
     *
     * override this method to add skin initialization code
     *
     */
    protected function initializeSkin():void {
        throw new IllegalOperationError("Skin.initializeSkin(): void is abstract and must be overriden");
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    [PreDestroy]
    /**
     *
     * dispose
     *
     */
    override final public function dispose():void {
		config::debug {
			Logger.log("{0}->dispose", this);
		}
        super.dispose();
        disposeSkin();
    }

    /**
     *
     * override this method to add skin dispose code
     *
     */
    protected function disposeSkin():void {
        throw new IllegalOperationError("Skin.disposeSkin(): void is abstract and must be overriden");
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     *
     * Factory method for Scale3Image
     *
     * @param source
     * @param start
     * @param end
     * @param direction
     * @param textureScale
     * @return
     *
     */
    protected function createScale3Image(source:Texture = null, start:Number = 0, end:Number = NaN, direction:String = "horizontal", textureScale:Number = 1, properties:Object = null):Scale3Image {
        if (isNaN(end)) {
            if (direction == Scale3Textures.DIRECTION_HORIZONTAL) {
                end = source.width;
            } else {
                end = source.height;
            }
        }
		
		config::debug {
			Logger.log("{0}->createScale3Image source:{1} start:{2} end:{3} direction:{4} textureScale:{5} properties:{6}", this, source, start, end, direction, textureScale, properties);				
		}
			
        var image:Scale3Image = new Scale3Image(new Scale3Textures(source, start, end, direction), textureScale);
        image.useSeparateBatch = false;
        if (properties) {
            applyProperties(image, properties);
        }
        return image;
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     *
     * apply properties to object
     *
     * @param target
     * @param properties
     *
     */
    private function applyProperties(target:Object, properties:Object):void {

		config::debug {
			Logger.log("{0}->applyProperties target:{1} properties:{2}", this, target, properties);				
		}
		
		
        for (var name:String in properties) {
            target[name] = properties[name];
        }

    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    /**
     *
     * factory method for Scale9Image
     *
     * @param source
     * @param grid
     * @param textureScale
     * @return
     *
     */
    protected function createScale9Image(source:Texture = null, grid:Rectangle = null, textureScale:Number = 1, properties:Object = null):Scale9Image {
		
        if (!grid) {
            grid = new Rectangle(0, 0, source.width, source.height);
        }
		
		config::debug {
			Logger.log("{0}->createScale9Image source:{1} grid:{2} textureScale:{3} properties:{4}", this, source, grid, textureScale, properties);				
		}
			
        var image:Scale9Image = new Scale9Image(new Scale9Textures(source, grid), textureScale);
        image.useSeparateBatch = false;
        if (properties) {
            applyProperties(image, properties);
        }
        return image;
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     *
     * factory method for image loader
     *
     * @param source
     * @return
     *
     */
    protected function createImageLoader(source:* = null, properties:Object = null):ImageLoader {
		config::debug {
			Logger.log("{0}->createImageLoader source:{1} properties:{2}", this, source, properties);				
		}
        var loader:ImageLoader = new ImageLoader();
        loader.source = source;
        if (properties) {
            applyProperties(loader, properties);
        }
        return loader;
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     *
     * @param source
     * @return
     *
     */
    protected function createImage(source:Texture = null, scaledSize: Boolean = false, properties:Object = null):Image {
        if (!source) {
            source = Texture.empty(scale(10), scale(10), false, false);
        }
        var image:Image = new Image(source);
        //image.touchable = false;
		config::debug {
        	Logger.log("{0}->createImage source:{1} properties:{2}", this, source, properties);				
		}
			if (!scaledSize) {
        		image.readjustSize();
			} else {
				image.width = scale(source.width);
				image.height= scale(source.height)
			}

        if (properties) {
            applyProperties(image, properties);
        }
        return image;
    }

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	protected function setSize(target:DisplayObject, width:Number, height:Number):void {
		var newWidth: Number = scale(width);
		var newHeight: Number = scale(height);
		config::debug {
			Logger.log("{0}->setSize target:{1} original:{2}x{3} scaled:{4}x{5}", this, target, width, height, newWidth, newHeight);				
		}
        target.width = scale(width);
        target.height = scale(height);
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	protected function createQuadBorder(color: uint = 0, alpha: Number = 1, thickness: Number = 1, padding: Number = 0, backgroundSkin: DisplayObject = null): QuadBorder {
		var border: QuadBorder = new QuadBorder();
		border.backgroundSkin = backgroundSkin;
		border.borderColor = color;
		border.borderAlpha = alpha;
		border.thickness = scale(thickness);
		border.padding = padding;
		return border;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	protected function createQuad(color: uint = 0, alpha: Number = 1, scaledSize: Boolean = true, width: Number = 10, height: Number = 10): Quad {
		var quad: Quad = new Quad(scale(width), scale(height), color);
		quad.alpha = alpha;
		return quad;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	protected function get stageHeight(): Number {
		return Starling.current.stage.stageWidth;
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	protected function get stageWidth(): Number {
		return Starling.current.stage.stageHeight;		
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
}