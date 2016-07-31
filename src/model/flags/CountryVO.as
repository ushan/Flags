/**
 * Created by Ushan on 26.07.2016.
 */
package model.flags {
import starling.textures.Texture;

public class CountryVO {
	public var prefix 		:String;
	public var texture 		:Texture;
	public var fullSizeURL	:String;
	public var name			:String;
	public function get text():String {return name}
	public function CountryVO(prefix:String, name:String)
	{
		this.prefix = prefix;
		this.name = name;
	}
}
}
