//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by Danil Bochkarev on 20.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var textF = ""
    @State var scrollToIndex = 0
    
    var body: some View {
        
        VStack {
            TextField(text: $textF) {
                Text("Enter a # here...")
            }
            .frame(height: 55)
            .border(Color.gray)
            .padding(.horizontal)
            .keyboardType(.numberPad)
            
            Button {
                withAnimation(.spring()) {
                    if let index = Int(textF) {
                        scrollToIndex = index
                    }
                }
            } label: {
                Text("SCROLL NOW")
            }

            
            ScrollView {
                ScrollViewReader { proxy in
                    
                    
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
