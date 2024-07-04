//
//  ContentView.swift
//  Calculator
//
//  Created by Manish Agarwal on 04/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var calculatorLogic = BasicFunctions()
    
    let buttons = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
    ]
    let lastButtons = ["0", ".", "="]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {
        ZStack{
            Color.brandPrimary
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(calculatorLogic.display)
                        .font(.system(size: 65))
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .padding()
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                }
                .padding(.trailing)
                    
                LazyVGrid(columns: columns, spacing: 15){
                    ForEach(buttons.indices, id: \.self) { row in
                        ForEach(buttons[row].indices, id: \.self) { column in
                            Button(action: {
                                calculatorLogic.buttonAction(buttons[row][column])
                            }, label:{
                                Text(buttons[row][column])
                                    .modifier(StandardStyle(button: buttons[row][column]))
                            })
                        }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                HStack(spacing: 20){
                    ForEach(lastButtons.indices, id: \.self) { index in
                        Button(action: {
                            calculatorLogic.buttonAction(lastButtons[index])
                        }, label:{
                            Text(lastButtons[index])
                                .modifier(StandardStyle(button: lastButtons[index]))
                        })
                    }
                }
                .padding(.top)
            }
        }
    }
}
#Preview {
    ContentView()
}
