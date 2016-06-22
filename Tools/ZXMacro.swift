import UIKit

public struct ZXMacroStruct{

    public let DeviceId      = UIDevice.currentDevice().identifierForVendor!.UUIDString
    
    public let ScreenWidth   = UIScreen.mainScreen().bounds.size.width
    public let ScreenHeight  = UIScreen.mainScreen().bounds.size.height
    
    public let SystemVersion = (UIDevice.currentDevice().systemVersion as NSString).floatValue
}
public let ZXMacro = ZXMacroStruct()

