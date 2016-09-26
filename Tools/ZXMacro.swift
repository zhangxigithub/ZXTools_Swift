import UIKit

public struct ZXMacroStruct{

    public let UUID      = UIDevice.current.identifierForVendor!.uuidString
    
    public let ScreenWidth   = UIScreen.main.bounds.size.width
    public let ScreenHeight  = UIScreen.main.bounds.size.height
    
    public let SystemVersion = (UIDevice.current.systemVersion as NSString).floatValue
}
public let ZXMacro = ZXMacroStruct()

