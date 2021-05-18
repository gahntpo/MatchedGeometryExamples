//
//  CirclePicker.swift
//  MatchedGeometryExamples
//


import SwiftUI

struct CirclePicker: View {
    let items: [String] = ["first", "second", "third"]
    
    let size: CGFloat = 15
    let selectedSize: CGFloat = 20
    
    @Namespace private var namespace
    
    @State private var selection: String = "first"
    //TODO: @Binding
    //TODO: Generic instead String
    
    var body: some View {
        VStack {
       
            ForEach(items, id: \.self) { item in
                HStack {
                    Circle().stroke(item == selection ? Color.accentColor :  Color.gray)
                        .frame(width: item == selection ? selectedSize : size,
                               height: item == selection ? selectedSize : size)
                        .matchedGeometryEffect(id: item, in: namespace, properties: .frame, isSource: true)
                    
                    /*
                     let frame = view.frame
                     */
                    
                    
                    Text(item)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        selection = item
                    }
                    
                }
            }.background(
                
                Circle()
                    .fill(Color.accentColor)
                    .matchedGeometryEffect(id: selection, in: namespace,
                                           properties: .frame, isSource: false)
                    //                .frame(width: 10, height: 10)
                    .frame(width: 20, height: 20)
                
            )
            /*
             circle.frame = frame
             */
        
            
        }
    }
}

struct CirclePicker_Previews: PreviewProvider {
    static var previews: some View {
        CirclePicker()
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
