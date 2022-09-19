//
//  nbaTeamGame1.0.swift
//  Guess-A
//
//  Created by Harris Awan on 18/9/2022.
//

import SwiftUI
enum ActiveAlert{
    case correct, incorrect, gameCorrect, gameIncorrect
}
struct nbaTeamGame1_0: View {
    var level: String
    @State var finishViewNavigate = false
    @State private var showHelpCard = false
    @State private var correctA = false
    @State var activeAlert: ActiveAlert = .incorrect
    @State var guess: String = ""
    var body: some View {
        List{
        VStack{
            Text("Guess The Team")
                    .fontWeight(.bold)
            Image(answers[randomNum1])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical)
                    .frame(width: 250)
        
            TextField("Guess", text: $guess)
                .border(.black, width: 2.0)
        }
            ZStack{
                NavigationLink(destination: nbaTeamLevels(), isActive: $finishViewNavigate) { Text("") }
             
            Button {
                if guess == answers[randomNum1] && roundCount != 8{
                    correctA.toggle()
                    self.activeAlert = .correct
                    currentScore = currentScore + 1
                    roundCount = roundCount + 1
                }
                else if guess != answers[randomNum1] && roundCount != 8 {
                    correctA.toggle()
                    self.activeAlert = .incorrect
                    roundCount = roundCount + 1
                }
                else if guess == answers[randomNum1] && roundCount == 8 {
                    correctA.toggle()
                    currentScore = currentScore + 1
                    self.activeAlert = .gameCorrect
                }
                else if
                    guess != answers[randomNum1] &&
                    roundCount == 8 {
                        correctA.toggle()
                        self.activeAlert = .gameIncorrect
                }
                } label: {
                    Text("Guess")
        }
        .alert(isPresented: $correctA) {
            switch activeAlert{
            case .correct:
                return Alert(title: Text("Correct"),

        dismissButton:
        .default(Text("Ok"),
            action: {
            generaterandomNum()
                })
                )
            case .incorrect:
                return Alert(title: Text("Wrong"),
                             dismissButton:
                             .default(Text("Ok"),
                                 action: {
                                 generaterandomNum()
                                     })
                                     )
            case .gameCorrect:
                return Alert(title: Text("game finished"),
                dismissButton:
                .default(Text("Ok"),
                         action: {finishViewNavigate.toggle()}
                             ))
            case .gameIncorrect:
                return Alert(title: Text("game finished"),
                dismissButton:
                .default(Text("Ok"),
                action: {finishViewNavigate.toggle()}
                                          ))
            }



        }
                             }
        .toolbar {
            Button() {
                showHelpCard.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
            }
            .alert(isPresented: $showHelpCard) {Alert(title: Text("Help!"), message: Text("To guess the team name input a team in the text field"),




                dismissButton:
                    .default(Text("Ok")))

            }
    }

        
    }
}
    
                             }





struct nbaTeamGame1_0_Previews: PreviewProvider {
    static var previews: some View {
        nbaTeamGame1_0(level: "")
    }
}

