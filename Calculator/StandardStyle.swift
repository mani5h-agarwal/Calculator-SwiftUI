//
//  StandardStyle.swift
//  Calculator
//
//  Created by Manish Agarwal on 04/07/24.
//

import SwiftUI

struct StandardStyle: ViewModifier {
    
    var button: String
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .frame(
                width: buttonWidth(button: button),
                height: buttonHeight())
            .background(buttonColor(button: button))
            .cornerRadius(.infinity)
            .foregroundColor(foreGroundColor(button: button))
    }
}

func buttonWidth(button: String) -> CGFloat{
    if button == "0" {
        return (UIScreen.main.bounds.width - 60)/2
    }
    return (UIScreen.main.bounds.width - 100)/4
}

func buttonHeight() -> CGFloat{
    return (UIScreen.main.bounds.width - 100)/4
}

func buttonColor(button: String) -> Color{
    switch button {
    case "AC", "+/-", "%":
        return .threebutton
    case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
        return .restbutton
    default:
        return .fivebutton
        
    }
}

func foreGroundColor(button: String) -> Color{
    switch button {
    case "AC", "+/-", "%":
        return .black
    default:
        return .white
        
    }
}
