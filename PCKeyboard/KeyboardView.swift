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
                        } else if key == "И" {
                            KeyView(title: key, longPressTitles: ["І", "Ї"])
                        } else if key == "Е" {
                            KeyView(title: key, longPressTitles: ["Ё", "Ѐ", "Ѣ"])
                        } else if key == "Ч" {
                            KeyView(title: key, longPressTitles: ["Ђ", "Ћ"])
                        } else if key == "У" {
                            KeyView(title: key, longPressTitle: "Ў")
                        } else if key == "К" {
                            KeyView(title: key, longPressTitle: "Ќ")
                        } else if key == "Э" {
                            KeyView(title: key, longPressTitle: "Є")
                        } else if key == "Ж" {
                            KeyView(title: key, longPressTitle: "Џ")
                        } else if key == "Г" {
                            KeyView(title: key, longPressTitles: ["Ѓ", "Ґ", "Ғ"])
                        } else if key == "Н" {
                            KeyView(title: key, longPressTitle: "Њ")
                        } else if key == "Л" {
                            KeyView(title: key, longPressTitle: "Љ")
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
