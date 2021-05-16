//
//  SwopView.swift
//  MatchedGeometryExamples
//
//  Created by Karin Prater on 16.05.21.
//

import SwiftUI

struct SwopView: View {
    
    @Namespace var namespace
    
    @State var isVertical: Bool = false
    
    var body: some View {
        
        VStack {
        
            if isVertical {
                VStack {
                    content
                }
            }else {
                HStack {
                    content
                }
            }
        
            Button(action: {
                withAnimation {
                    isVertical.toggle()
                }
                
            }, label: {
                Text("swop views")
            })
        }
        
    }
    
    @ViewBuilder var content: some View {
        Group {
            Rectangle()
                .matchedGeometryEffect(id: "rectangle", in: namespace)
            Circle()
                .matchedGeometryEffect(id: "circle", in: namespace)
        }
    }
}

struct SwopView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        Group {
            SwopView(isVertical: true)
            SwopView()
        }
    }
}
