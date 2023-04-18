//
//  KeyboardView.swift
//  PCKeyboard
//
//  Created by Andrei Popov on 18.04.2023.
//

import SwiftUI

struct KeyView: View {
    var title: String
    var longPressTitles: [String]?
    var color: Color = .white
    @State var isLongPress: Bool = false
    @State var currentLongPressTitleIndex = 0
    @State private var currentTitle: String

    init(title: String, longPressTitles: [String]? = nil, color: Color = .white) {
        self.title = title
        self.longPressTitles = longPressTitles
        self.color = color
        self._currentTitle = State(initialValue: title)
    }

    var body: some View {
        let binding = Binding<String>(
            get: { currentTitle },
            set: { newTitle in
                currentTitle = newTitle
                print("Button \(title) long pressed with new title \(newTitle)")
            }
        )

        return Button(action: {
            print("Button \(currentTitle) tapped")
        }, label: {
            Text(currentTitle)
                .font(.title)
                .foregroundColor(.primary)
        })
        .background(color)
        .cornerRadius(5)
        .onLongPressGesture {
            if let longPressTitles = longPressTitles {
                print("Button \(title) long pressed")
                isLongPress = true
                currentLongPressTitleIndex = (currentLongPressTitleIndex + 1) % longPressTitles.count
                let newTitle = longPressTitles[currentLongPressTitleIndex]
                binding.wrappedValue = newTitle
            }
        }
    }
}

struct KeyboardView: View {
    let keys = [
        ["Й", "Ц", "У", "К", "Е", "Н", "Г", "Ш", "Щ", "З", "Х", "Ъ"],
        ["Ф", "Ы", "В", "А", "П", "Р", "О", "Л", "Д", "Ж", "Э"],
        ["Я", "Ч", "С", "М", "И", "Т", "Ь", "Б", "Ю", "Delete"]
    ]
    
    //
    
    var body: some View {
        VStack {
            ForEach(keys, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(row, id: \.self) { key in
                        if key == "Delete" {
                            KeyView(title: key, color: Color.red)
                        } else if key == "Й" {
                            KeyView(title: key, longPressTitles: ["Ѝ", "Ј"])
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
