
import SwiftUI

struct SuccessView: View {
  @ScaledMetric var imageSize: CGFloat = 80
  @Environment(\.presentationMode) var presentationMode
  @Binding var game: Game
  let score: Int
  let target: RGB
  @Binding var guess: RGB

  var body: some View {
    ZStack {
      VStack {
        Image("wand")
          .resizable()
          .frame(width: imageSize, height: imageSize)
          .accessibilityHidden(true)
        Text("Congratulations!")
          .font(.largeTitle)
          .fontWeight(.semibold)
          .padding(.bottom)
        VStack(spacing: 10) {
          Text("You scored \(score) points on this color.")
            .padding(.bottom)
          ColorText(
            text: "Target: " + target.intString,
            bkgd: Color(rgb: target))
          .accessibilityLabel("Target: " + target.accString)
          ColorText(
            text: "Guess: " + guess.intString,
            bkgd: Color(rgb: guess))
          .accessibilityLabel("Your guess: " + guess.intString)
        }
        .font(.title3)
        .foregroundColor(Color("grayText"))
        .multilineTextAlignment(.center)
      }
      .accessibilityElement(children: .combine)
      VStack(spacing: 20) {
        Spacer()
        Button("Try another one?") {
          game.startNewRound()
          guess = RGB()
          presentationMode.wrappedValue.dismiss()
        }
          .buttonStyle(
            NeuButtonStyle(width: 327, height: 48)
        )
      }
    }
  }
}

struct ColorText: View {
  let text: String
  let bkgd: Color

  var body: some View {
    Text(text)
      .padding(10)
      .background(Capsule().fill(bkgd))
      .foregroundColor(bkgd.accessibleFontColor)
      .font(.footnote)
  }
}

struct SuccessView_Previews: PreviewProvider {
  static var previews: some View {
    SuccessView(
      game: .constant(Game()),
      score: 95,
      target: RGB(),
      guess: .constant(RGB()))
      
  }
}
