//
//  ContentView.swift
//  PanCyr
//
//  Created by Andrei Popov on 18.04.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextField("Type here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
