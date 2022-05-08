
import SwiftUI

struct ColorSlider: View {
  @Binding var value: Double
  var trackColor: Color
  
  var body: some View {
    HStack {
      Text("0")
        .frame(width: 30)
        .accessibilityHidden(true)
      Slider(value: $value)
        .tint(trackColor)
        .accessibilityValue(String(describing: trackColor) + String(Int(value * 255)))
      Text("255")
        .frame(width: 30)
        .accessibilityHidden(true)
    }
    .font(.subheadline)
    .padding(.horizontal)
  }
}
