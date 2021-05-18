//
//  CatCollectionView.swift
//  MatchedGeometryExamples
//


import SwiftUI

struct CatCollectionView: View {
    
    let cats: [String] = ["minime", "minime_serious", "cleo"]
    
    @State private var selectedCat: String? = nil
    @Namespace private var namespace
    
    var body: some View {
        ZStack {
            VStack {
                Text("Meet the cats").font(.title)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        ForEach(cats, id: \.self) { cat in
                            
                            Image(cat)
                                .resizable()
                                .scaledToFill()
                                
                                .animation(nil)
                                .matchedGeometryEffect(id: cat,
                                                       in: namespace,
                                                       properties: .frame,
                                                       anchor: .center,
                                                       isSource: cat != selectedCat)
                                .frame(maxWidth: 160, maxHeight: 160)
                                .cornerRadius(20)
                                .onTapGesture {
                                    withAnimation {
                                        selectedCat = cat
                                    }
                                    
                                }
                                .zIndex(cat == selectedCat ? 1 : 0)
                        }
                        
                    }.padding()
                }
                .frame(maxHeight: 200)
                
                
                Spacer()
            }
            
            if selectedCat != nil {
                
                CatView(namespace: namespace, selectedCat: $selectedCat)
                
                
            }
            
        }
    }
}

struct CatCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CatCollectionView()
    }
}


