//
//  ContentView-2.swift
//  calculator
//
//  Created by BERKE on 29.01.2022.
//

import SwiftUI

struct ContentViewTwo: View {
    @State private var displayNumber = ""
    @State private var operand1 = 0
    @State private var operand2 = 0
    @State private var calculation = ""
    @State private var secondOperation = false 

    let myGridItem = [GridItem(.flexible(minimum: 30, maximum: 100)),GridItem(.flexible(minimum: 30, maximum: 100)),GridItem(.flexible(minimum: 30, maximum: 100)),GridItem(.flexible(minimum: 30, maximum: 100))]

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    TextField("", text: $displayNumber)
                        .font(.system(size: 70))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .frame(minWidth:0,maxWidth: .infinity,maxHeight: 150)
                        .padding(.horizontal,5)
                }

                VStack{
                    LazyVGrid(columns: myGridItem, content: {
                        ForEach(myButtons,id:\.self){buttons in
                            ButtonsView(name: buttons)
                                .onTapGesture {
                                    checkOperation(input: buttons)
                                }
                        }
                    })
                }.padding()
            }
        }
    }

    func checkOperation(input: String){
        guard input != "AC" else {
            restart()
            return
        }

        guard input != "=" else{
            if calculation.isEmpty{
                return
            }
            else{
                switch calculation {
                case "+":
                    displayNumber = String(operand1 + operand2)
                    reset()
                case "-":
                    displayNumber = String(operand1 - operand2)
                    reset()
                case "*":
                    displayNumber = String(operand1 * operand2)
                    reset()
                case "÷":
                    displayNumber = String(operand1 / operand2)
                    reset()

                default:
                    print("hi there")
                }
            }
            return
        }

        if Int(input) != nil {
            sendToDisplay(input)
            return
        }

        if calculation.isEmpty{
        calculation = input
            secondOperation = true
        }
        else{
            calculation = input
        }

    }

    func restart(){
        operand2 = 0
        operand1 = 0
        calculation = ""
        displayNumber = ""
    }

    func reset(){
        operand1 = 0
        operand2 = 0
        calculation = ""
    }
    func sendToDisplay(_ number:String){
        guard displayNumber.count <= 9 else {
            return
        }

        if secondOperation {
            displayNumber = ""
            secondOperation = !secondOperation
        }

        if calculation.isEmpty{
            displayNumber += number
            operand1 = Int(displayNumber)!
        }
        else{
            displayNumber += number
            operand2 = Int(displayNumber)!
        }

    }

}

struct ContentViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTwo()
    }
}
