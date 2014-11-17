package feathers.app {
import feathers.controls.LayoutGroup;

public class FeathersConfig {
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    public var mainClass:Class = null;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    public var backgroundColor:uint = 0xFFFFFF;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    public var starlingProperties:Object = null;

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var simulateScale:Boolean = false;
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public var simulatedScale:Number = 1;
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
    public function FeathersConfig(mainClass:Class = null, backgroundColor:uint = 0xFFFFFF, simulatedScale: Number = NaN, starlingProperties:Object = null) {
        if (!mainClass) {
            mainClass = LayoutGroup;
        }
        this.mainClass = mainClass;
        this.backgroundColor = backgroundColor;
        this.starlingProperties = starlingProperties;
		if (isNaN(simulatedScale)) {
		this.simulateScale = false;
		this.simulatedScale = 1;	
		} else {
			this.simulateScale = true;
			this.simulatedScale = simulatedScale;
		}
    }
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
}
