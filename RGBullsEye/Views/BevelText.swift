
import SwiftUI

struct BevelText: View {
  let text: String

  var body: some View {
    Text(text)
      .padding(.vertical, 8)
      .padding(.horizontal, 16)
      .background(
        ZStack {
          Capsule()
            .fill(Color.element)
            .northWestShadow(radius: 2, offset: 1)
          Capsule()
            .inset(by: 3)
            .fill(Color.element)
            .southEastShadow(radius: 1, offset: 1)
        }
      )
  }
}

