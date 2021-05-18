//
//  PickerExamples.swift
//  MatchedGeometryExamples
//
//  Created by Karin Prater on 18.05.21.
//

import SwiftUI

struct PickerExamples: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Pick something").font(.title)
            
            CirclePicker()
            SliderPicker()
            
            Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.")
                .font(.footnote)
            
            CalenderView()
           
        }.padding()
    }
}

struct PickerExamples_Previews: PreviewProvider {
    static var previews: some View {
        PickerExamples()
    }
}
