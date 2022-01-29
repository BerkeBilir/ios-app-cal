//
//  ButtonsView.swift
//  calculator
//
//  Created by BERKE on 29.01.2022.
//

import SwiftUI

struct ButtonsView: View {
    var name:String
    var bgColor:Color{
        switch name {
        case "1","2","3","4","5","6","7","8","9","0",".":
            return Color(.systemGray2)
        case "AC","+/-","%":
            return Color(.systemGray4)
        default:
            return .orange
        }
    }

    var foregroundColor:Color{
        switch name {
        case "AC","+/-","%":
            return .black
        default:
            return .white
        }
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(bgColor)
            .frame(width: 80, height: 80)
            .overlay(
            Text(name)
                .font(.largeTitle)
                .foregroundColor(foregroundColor)
            )

    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(name: "0")
    }
}
