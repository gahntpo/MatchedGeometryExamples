//
//  CatView.swift
//  MatchedGeometryExamples
//
//  Created by Karin Prater on 18.05.21.
//

import SwiftUI

struct CatView: View {
    let namespace: Namespace.ID
    @Binding var selectedCat: String?
    
    let cornerRadius: CGFloat = 20
    
    var body: some View {
        
        
        if selectedCat != nil {
            VStack {
            Image(selectedCat!)
                .resizable()
                .scaledToFit()
              
                .animation(nil)
                
                .transition(.asymmetric(insertion: .identity, removal: .opacity))
                .matchedGeometryEffect(id: selectedCat!,
                                       in: namespace,
                                       properties: .frame,
                                       anchor: .center,
                                       isSource: selectedCat != nil)
                
                Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet, consetetur sadipscing elitre.")
                    .font(.footnote)
                    .padding()
                
            }
            .cornerRadius(cornerRadius)
            .background(Color(.systemBackground)
                            .cornerRadius(20)
                            .shadow(radius: cornerRadius))
            .padding()
            .onTapGesture {
                withAnimation {
                    selectedCat = nil
                }
                
            }
            

            
            
            
        }else {
            EmptyView()
        }
        
    }
}

struct CatView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CatView(namespace: namespace, selectedCat: .constant("minime"))
    }
}
