//
//  AdaptiveCatView.swift
//  MatchedGeometryExamples
//
//  Created by Karin Prater on 16.05.21.
//

import SwiftUI

struct AdaptiveCatView: View {
    
    @Environment(\.verticalSizeClass) var veri: UserInterfaceSizeClass?
    
    var body: some View {
        
        GeometryReader  { geometry in
            ConditionalStack(vAlignment: .center, hAlignment: .center, vSpacing: 10, hSpacing: 10, isVStack: geometry.size.width < geometry.size.height) {

            
            VStack(alignment: .leading) {
                HStack {
                    Image("minime_serious")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100, alignment: .center)
                    Text("Minime - 2020")
                }
                
                Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.")
                    .font(.footnote)
            }
            
            Image("minime")
                .resizable()
                .scaledToFit()
        }
        .padding()
        }
    }
}

struct AdaptiveCatView_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveCatView()
    }
}