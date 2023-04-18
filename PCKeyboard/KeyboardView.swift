//
//  KeyboardView.swift
//  PCKeyboard
//
//  Created by Andrei Popov on 18.04.2023.
//

import SwiftUI

struct KeyView: View {
    var title: String
    var longPressTitle: String?
    var color: Color = .white
    var isLongPress: Bool = false

    var body: some View {
        Button(action: {
            print("Button \(title) tapped")
        }, label: {
            Text(String(title))
                .font(.title)
                .foregroundColor(.primary)
        })
        .background(color)
        .cornerRadius(5)
    }
}

struct KeyboardView: View {
    let keys = [
        ["Й", "Ц", "У", "К", "Е", "Н", "Г", "Ш", "Щ", "З", "Х", "Ъ"],
        ["Ф", "Ы", "В", "А", "П", "Р", "О", "Л", "Д", "Ж", "Э"],
        ["Я", "Ч", "С", "М", "И", "Т", "Ь", "Б", "Ю", "Delete"]
    ]
    
    var body: some View {
        VStack {
            ForEach(keys, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(row, id: \.self) { key in
                        if key == "Delete" {
                            KeyView(title: key, color: Color.red)
                        } else {
                            KeyView(title: key)
                        }
                    }
                }
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}
