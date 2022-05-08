
import SwiftUI

extension Color {
  
  static let element = Color("Element")
  static let highlight = Color("Highlight")
  static let shadow = Color("Shadow")
  
  /// Create a Color view from an RGB object.
  ///   - parameters:
  ///     - rgb: The RGB object.
  init(rgb: RGB) {
    self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
  }
  
  // MARK: - font colors
  // From Apple's Scrumdinger app
  // developer.apple.com/tutorials/app-dev-training
  /// This color is either black or white, whichever is more accessible when viewed against this Color instance.
  var accessibleFontColor: Color {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: nil)
    return isLightColor(red: red, green: green, blue: blue) ? .black : .white
  }

  private func isLightColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> Bool {
    let lightRed = red > 0.65
    let lightGreen = green > 0.65
    let lightBlue = blue > 0.65

    let lightness = [lightRed, lightGreen, lightBlue].reduce(0) { $1 ? $0 + 1 : $0 }
    return lightness >= 2
  }
}
