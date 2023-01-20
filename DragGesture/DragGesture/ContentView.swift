//
//  ContentView.swift
//  DragGesture
//
//  Created by Danil Bochkarev on 20.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var offset: CGSize = .zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 100, height: 100, alignment: .center)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation(.spring()) {
                            offset = value.translation
                        }
                    })
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            offset = .zero
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
