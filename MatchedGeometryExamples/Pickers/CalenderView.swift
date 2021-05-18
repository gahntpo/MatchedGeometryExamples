//
//  CalenderView.swift
//  NewSwiftUIFeaturesTestProject
//
//  Created by Javier from SwiftUI-lab
// https://swiftui-lab.com/matchedgeometryeffect-part2/
//

import SwiftUI

struct CalenderView: View {
    @Namespace var ns
    @State private var selection: Int = 1
    
    var body: some View {
        VStack(spacing: 20) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                ForEach(0..<12) {  monthID in
                    
                    MonthView(selection: $selection, month: monthID)
                        .matchedGeometryEffect(id: monthID, in: ns)
                }
            })
        }.background(
            RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 3)
                .matchedGeometryEffect(id: selection, in: ns, isSource: false)
        )
    }
    
    struct MonthView: View {
        let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        @Binding var selection: Int
        let month: Int
        
        var body: some View {
            Text(monthNames[month])
                .fixedSize()
                .padding(10)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.40)) {
                        self.selection = month
                    }
                }
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
