package flixel.input.gamepad.id;
import flixel.input.gamepad.FlxGamepad;

/**
 * A helper class for gamepad input.
 * Provides optimized gamepad button checking using direct array access.
 */
@:keep
class FlxGamepadMotionValueList
{
	private var gamepad:FlxGamepad;
	
	@:allow(flixel.input.gamepad.FlxGamepad)
	/**whether or not the current gamepad model supports any motion features**/
	public var isSupported(default, null):Bool = true;
	
	/**analog value (-1.0 to +1.0) tilting towards or away from the ceiling (think "look up", "look down")**/
	public var TILT_PITCH   (get, never):Float; inline function get_TILT_PITCH() { return getAxis (FlxGamepadInputID.TILT_PITCH);}
	/**analog value (-1.0 to +1.0) tilting side-to-side (think "twisting", or "do a barrel roll!")**/
	public var TILT_ROLL    (get, never):Float; inline function get_TILT_ROLL()  { return getAxis (FlxGamepadInputID.TILT_ROLL); }
	
	public function new(gamepad:FlxGamepad)
	{
		this.gamepad = gamepad;
	}
	
	private inline function getAxis(id:FlxGamepadInputID):Float
	{
		if (!isSupported) return 0;
		return gamepad.getAxis(id);
	}
}