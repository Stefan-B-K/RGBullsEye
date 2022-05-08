
import SwiftUI

struct ContentView: View {
  @State var game = Game()
  @State var guess: RGB
  @State var showScore = false
  
  var body: some View {

      ZStack {
        Color.element
          .edgesIgnoringSafeArea(.all)
        VStack {
          ColorCircle(rgb: game.target, size: 200)
          BevelText(text: showScore ? game.target.intString : "R: ??? G: ??? B: ???")
            .accessibilityLabel("Red, green, blue, values you must guess")
          .padding(.top, 5)
          .padding(.bottom, 10)
          ColorCircle(rgb: guess, size: 200)
          BevelText(text: guess.intString)
          .padding(.top, 5)
          .padding(.bottom, 10)
          .accessibilityLabel("Your guess: " + guess.accString)
          .accessibilitySortPriority(2)
          ColorSlider(value: $guess.red, trackColor: .red)
            .accessibilitySortPriority(5)
          ColorSlider(value: $guess.green, trackColor: .green)
            .accessibilitySortPriority(4)
          ColorSlider(value: $guess.blue, trackColor: .blue)
            .accessibilitySortPriority(3)
          Button("Hit Me!") {
            showScore = true
            game.check(guess: guess)
          }
          .accessibilitySortPriority(1)
          .buttonStyle(NeuButtonStyle(width: 300, height: 35))
          .padding(.bottom)
          .sheet(isPresented: $showScore, content: {
            SuccessView(game: $game, score: game.scoreRound,
                        target: game.target, guess: $guess)
          })
//          .alert(isPresented: $showScore) {
//            Alert(title: Text("You scored \(game.scoreRound)"),
//                  message: Text("Target values: " + game.target.accString),
//                  dismissButton: .default(Text("OK")) {
//              game.startNewRound()
//              guess = RGB()
//            })
//          }
        }
        .font(.headline)
      }

  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(guess: RGB())
      
      
  }
}




