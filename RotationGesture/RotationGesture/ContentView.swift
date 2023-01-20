//
//  ContentView.swift
//  RotationGesture
//
//  Created by Danil Bochkarev on 20.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("test")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged({ value in
                        angle = value
                    })
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
