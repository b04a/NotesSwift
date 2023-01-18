//
//  LongPressGesture.swift
//  LongPressGesture
//
//  Created by Danil Bochkarev on 18.01.2023.
//

import SwiftUI

struct LongPressGesture: View {
    
    @State var isComplete = false
    @State var isSuccess = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .font(.system(size: 20))
                    .fontWeight(.black)
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                        
                    } perform: {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .font(.system(size: 20))
                    .fontWeight(.black)
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
//        Text(isComplete ? "COMPLETE" : "NOT COMPLETE")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(12)
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 4.0) {
//                isComplete.toggle()
//            }
    }
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesture()
    }
}
