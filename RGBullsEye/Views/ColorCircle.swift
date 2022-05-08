
import SwiftUI

struct ColorCircle: View {
  var rgb: RGB
  let size: CGFloat
  
  var body: some View {
    
    ZStack {
      Circle()
        .fill(Color.element)
        .northWestShadow()
      Circle()
        .fill(Color(rgb: rgb))
        .padding(15)
    }
    .frame(idealWidth: size, idealHeight: size)
  }
}



struct ColorCircle_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.element
      ColorCircle(rgb: RGB(), size: 200)
    }
    .frame(width: 300, height: 300)
    .previewLayout(.sizeThatFits)
    
  }
}
