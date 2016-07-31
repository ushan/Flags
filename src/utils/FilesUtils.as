/**
 * Created by Ushan on 29.09.2014.
 */
package utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	public class FilesUtils
	{
		public static function writeXMLToFile(xml:XML, file:File):void
		{
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeUTFBytes(xml.toXMLString());
			stream.close();
		}

		public static function readXMLFromFile(file:File):XML
		{

			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);

			var result:ByteArray = new ByteArray();
			stream.readBytes(result, 0, file.size);
			stream.close();
			return new XML(result.toString());
		}

		public static function readJSONFromFile(file:File):Object
		{

			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);

			var result:ByteArray = new ByteArray();
			stream.readBytes(result, 0, file.size);
			stream.close();
			return new XML(result.toString());
		}

		public static function writeByteArrayToFile(byteArray:ByteArray, file:File):void
		{
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeBytes(byteArray, 0, byteArray.bytesAvailable);
			stream.close();
		}
	}
}
