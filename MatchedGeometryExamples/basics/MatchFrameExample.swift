//
//  MatchFrameExample.swift
//  MatchedGeometryExamples
//
//  Created by Karin Prater on 16.05.21.
//

import SwiftUI

struct MatchFrameExample: View {
    
    @Namespace private var namespace
    
    let geometryId: String = "geometryId"
    @State private var isMatched: Bool = false
    
    var body: some View {
        
        
        VStack {
            
            VStack(spacing: 30) {
                Text("Hello, World!")
                    .fixedSize()
                    .padding()
                    .border(Color.yellow)
                    .matchedGeometryEffect(id: geometryId,
                                           in: namespace,
                                           properties: .size,
                                           anchor: .center,
                                           isSource: isMatched)
                    /*
                     isSource is true
                     let frame = view.frame
                     */
                    
                    .zIndex(1)
                    .onTapGesture {
                        withAnimation {
                        isMatched = true
                        }
                    }
                
                Text("Selection")
                    .matchedGeometryEffect(id: geometryId,
                                           in: namespace,
                                           properties: .size,
                                           anchor: .center,
                                           isSource: !isMatched)
                    .onTapGesture {
                        withAnimation {
                        isMatched = false
                        }
                    }
                
                
//                Button(action: {
//                    withAnimation {
//                        isMatched.toggle()
//                    }
//
//                }, label: {
//                    Text("match red box")
//                })
            }
            .padding()
            .background(
                Rectangle()
                    .fill(Color.red)
                    .matchedGeometryEffect(id: geometryId,
                                           in: namespace,
                                           properties: .frame,
                                           anchor: .center,
                                           isSource: false)
                    
                    /*
                     isSource is false
                     view.frame /size / postion = frame
                     */
                    
                    .zIndex(0)
                    .border(Color.pink, width: 2)
            )
            
            Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.")
        }
        
        
    }
}

struct MatchFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        MatchFrameExample()
    }
}
