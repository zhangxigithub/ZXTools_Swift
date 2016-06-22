import UIKit



let DeviceId      = UIDevice.currentDevice().identifierForVendor!.UUIDString

let ScreenWidth   = UIScreen.mainScreen().bounds.size.width
let ScreenHeight  = UIScreen.mainScreen().bounds.size.height

let SystemVersion = (UIDevice.currentDevice().systemVersion as NSString).floatValue