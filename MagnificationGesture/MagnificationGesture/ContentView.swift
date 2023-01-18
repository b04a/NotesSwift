//
//  ContentView.swift
//  MagnificationGesture
//
//  Created by Danil Bochkarev on 18.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35)
                Text("+ Future Hendrix")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            currentAmount = value - 1
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        })
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
        }
        
        
        
        
//        Text("HELLO")
//            .font(.title)
//            .padding(40)
//            .background(Color.red.cornerRadius(20))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged({ value in
//                        currentAmount = value - 1
//                    })
//                    .onEnded({ value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    })
//            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
