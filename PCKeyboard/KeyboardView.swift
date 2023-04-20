//
//  KeyboardView.swift
//  PCKeyboard
//
//  Created by Andrei Popov on 18.04.2023.
//

import SwiftUI

struct KeyboardView: View {
    let keys = [
        ["Й", "Ц", "У", "К", "Е", "Н", "Г", "Ш", "Щ", "З", "Х"],
        ["Ф", "Ы", "В", "А", "П", "Р", "О", "Л", "Д", "Ж", "Э"],
        ["Я", "Ч", "С", "М", "И", "Т", "Ь", "Б", "Ю", "Delete"]
    ]
    
    @Environment(\.colorScheme) var colorScheme
    
    var textDocumentProxy: UITextDocumentProxy?
    
    var body: some View {
        VStack {
            ForEach(keys, id: \.self) { row in
                HStack(spacing: 1) {
                    ForEach(row, id: \.self) { key in
                        if key == "Delete" {
                            KeyView(title: key, color: Color.red, textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Й" {
                            KeyView(title: key, longPressTitles: ["Ј", "Й"], textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Г" {
                            KeyView(title: key, longPressTitles: ["Ѓ"], textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Е" {
                            KeyView(title: key, longPressTitles: ["Ё","Ѣ","Є"], textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Ц" {
                            KeyView(title: key, longPressTitles: ["Џ"], textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Ч" {
                            KeyView(title: key, longPressTitles: ["Ћ"], textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Н" {
                            KeyView(title: key, longPressTitles: ["_"], textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Л" {
                            KeyView(title: key, longPressTitles: ["Љ"], textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Н" {
                            KeyView(title: key, longPressTitles: ["Њ"], textDocumentProxy: self.textDocumentProxy)
                        } else if key == "Ж" {
                            KeyView(title: key, longPressTitles: ["Ђ"], textDocumentProxy: self.textDocumentProxy)
                        } else {
                            KeyView(title: key, textDocumentProxy: self.textDocumentProxy)
                        }
                    }
                }
            }
            Spacer()
        }
        .colorScheme(colorScheme)
    }
}


struct KeyView: View {
    var title: String
    var longPressTitles: [String]?
    var color: Color = .white
    @State var isLongPress: Bool = false
    @State var currentLongPressTitleIndex = 0
    @State private var currentTitle: String

    @GestureState private var longPressState: Bool = false
    
    var textDocumentProxy: UITextDocumentProxy?

    init(title: String, longPressTitles: [String]? = nil, color: Color = .white) {
        self.title = title
        self.longPressTitles = longPressTitles
        self.color = color
        self._currentTitle = State(initialValue: title)
    }

    var body: some View {
        let holdGesture = LongPressGesture(minimumDuration: 0.5)
            .sequenced(before: LongPressGesture())
            .updating($longPressState) { value, state, _ in
                switch value {
                case .first(true):
                    state = true
                default:
                    break
                }
            }
            .onEnded { value in
                if let longPressTitles = longPressTitles {
                    print("Button \(title) long pressed")
                    currentLongPressTitleIndex = (currentLongPressTitleIndex + 1) % longPressTitles.count
                    let newTitle = longPressTitles[currentLongPressTitleIndex]
                    currentTitle = newTitle
                }
            }

        ZStack {
            Button(action: {
                if let proxy = self.textDocumentProxy {
                    proxy.insertText(currentTitle)
                }
                print("Button \(currentTitle) tapped")
            }, label: {
                Text(currentTitle)
                    .font(.title)
                    .foregroundColor(.primary)
            })
            .background(color)
            .cornerRadius(5)
            .simultaneousGesture(holdGesture)

            if longPressState {
                Rectangle()
                    .foregroundColor(Color.secondary)
                    .opacity(0.5)
            }
        }
    }
}
