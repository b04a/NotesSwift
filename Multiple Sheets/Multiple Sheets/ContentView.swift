//
//  ContentView.swift
//  Multiple Sheets
//
//  Created by Danil Bochkarev on 20.01.2023.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct ContentView: View {
    @State var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE")
    @State var isPresented = false
    @State var selectedIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                selectedIndex = 1
                selectedModel = RandomModel(title: "ONE")
                isPresented.toggle()
            } label: {
                Text("Button 1")
            }

            Button {
                selectedIndex = 2
                selectedModel = RandomModel(title: "TWO")
                isPresented.toggle()
            } label: {
                Text("Button 2")
            }
        }
        .sheet(isPresented: $isPresented) {
            if selectedIndex == 1 {
                NextScreen(selectedModel: RandomModel(title: "ONE"))
            } else if selectedIndex == 2 {
                NextScreen(selectedModel: RandomModel(title: "TWO"))
            } else {
                NextScreen(selectedModel: RandomModel(title: "STARTING TITLE"))
            }
        }
    }
}

struct NextScreen: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
