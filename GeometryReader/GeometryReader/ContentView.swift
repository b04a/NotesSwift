//
//  ContentView.swift
//  GeometryReader
//
//  Created by Danil Bochkarev on 20.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width * 0.6666)
                
                Rectangle()
                    .fill(Color.blue)
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
