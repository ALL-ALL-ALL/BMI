//
//  ContentView.swift
//  BMI
//
//  Created by  Ixart on 21/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var Height = 1.0        // c'est la hauteur
    
    @State private var Weight = 50.50       // c'est le poid
    
    
    var bmi: Double {
        return Weight / (Height * Height)
    }
    
    
    func moodForBMI(bmi: Double) -> String {
            switch bmi {
            case 0..<18.5:
                return "Underweight"
            case 18.5..<24.29:
                return "Healthy"
            case 25..<29.9:
                return "Overweight"
            case 30..<34.9:
                return "Severely Overweight"
                
            case 35..<39.9:
                return "morbidly Overweight"
            default:
                return "Invalid BMI"
            }
        
        }
    
    
    func backgroundColorForBMI() -> Color {
        switch bmi {
        case 0..<18.5:
            Color.blue
        case 18.5..<24.9:
            Color.green
        case 25..<29.9:
            Color.orange
        case 30..<34.9:
            Color.red
        case 35..<39.9:
            Color.purple
        default:
            Color.gray
            
            
            
            
            
        } // FIN SWITCH
    } // FIN FUNCTION



    var body: some View {

            VStack{
    
                
                ZStack{
                    
                    
                    Rectangle()
                                        .frame(width: 400, height: 150)
                                        .foregroundColor(Color.gray) // Couleur de l'arrière-plan
                                        .padding(.top,-60)
                    
                    Text("BMI CALCULATOR")
                        .foregroundColor(.white)     // Changer la couleur du texte en noir
                        .font(.title)

                } // FIN ZSTACK
 
                Text("WHAT IS YOUR WEIGHT ?")
                    .padding(.top,100)

                    .font(.title)
                    .bold()
                Slider(value: $Weight, in: 0...200)
                Text("\(Weight, specifier: "%.2f")")    // Affiche la valeur actuelle du poids avec un décimal

                Spacer() // espace les deux bande grise
                
                Text("WHAT IS YOUR HEIGHT ?")
                    .font(.title)
                    .bold()
                Slider(value: $Height, in: 0...3)
                Text("\(Height, specifier: "%.2f")")  // Affiche la valeur actuelle du poids avec un décimal


                
            
                Spacer() // espace les deux bande grise
                
                

                ZStack{
                    Rectangle()

                                       .frame(width: 400, height: 150)
                                       .foregroundColor(Color.gray) // Couleur de l'arrière-plan
                                       .padding(.bottom,-40)
                    Text("\(bmi, specifier: "%.2f")")
                        .padding(.trailing,220)
                        .font(.title)
                        .bold()
                                   
                                Rectangle()
                                   
                                       .frame(width: 400, height: 150)
                                       .foregroundColor(backgroundColorForBMI()) // fait reference à la fonction switch que l'on applique ici
                                       .padding(.trailing,-280)
                                       .padding(.bottom,-40)
                    
                    
                    Text(moodForBMI(bmi: bmi)) // Utilise la fonction moodForBMI bmi

                        .offset(x: 90) // déplacer le texte vers la droite(X) horizontal sinon (y) vertical à utliser en dernier dernier recour
                        .font(.title)
                        .bold()
                    

                } // FIN ZSTACK
                           } // FIN VSTACK 1
    } // FIN BODY
} // FIN STRUCT

#Preview {
    ContentView()
}















