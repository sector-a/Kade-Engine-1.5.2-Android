package;

import flash.system.System;
import flixel.FlxG;
import haxe.CallStack.StackItem;
import haxe.CallStack;
import lime.app.Application;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;

/**
 * ...
 * @author: Saw (M.A. Jigsaw)
 * @modified: mcagabe19
 */
class SUtil
{
	/**
	 * Uncaught error handler, original made by: sqirra-rng
	 */
	public static function uncaughtErrorHandler()
	{
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, function(u:UncaughtErrorEvent)
		{
			var callStack:Array<StackItem> = CallStack.exceptionStack(true);
			var errMsg:String = '';

			for (stackItem in callStack)
			{
				switch (stackItem)
				{
					case FilePos(s, file, line, column):
						errMsg += file + ' (line ' + line + ')\n';
					default:
						Sys.println(stackItem);
				}
			}

			errMsg += u.error;

			Sys.println(errMsg);

			Application.current.window.alert(errMsg, 'Error!');
			System.exit(1);
		});
	}
}
