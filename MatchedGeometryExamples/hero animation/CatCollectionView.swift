//
//  CatCollectionView.swift
//  MatchedGeometryExamples
//


import SwiftUI

struct CatCollectionView: View {
    
    let cats: [String] = ["minime", "minime_serious", "cleo"]
    
    @State private var selectedCat: String? = nil
    @State private var topmostCat: String? = nil
    @Namespace private var namespace
    
    var body: some View {
        ZStack {
            VStack {
                Text("Meet the cats").font(.title)
                    .blur(radius: (selectedCat == nil) ? 0 : 5)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        ForEach(cats, id: \.self) { cat in
                            
                            Image(cat)
                                .resizable()
                                .scaledToFill()
                                //
                                
                                .matchedGeometryEffect(id: cat,
                                                       in: namespace,
                                                       isSource: cat != selectedCat)
                                .frame(maxWidth: 160, maxHeight: 160)
                                .cornerRadius(20)
                                .onTapGesture {
                                    withAnimation {
                                        selectedCat = cat
                                    }
                                    
                                }
                                .zIndex(cat == topmostCat ? 1 : 0)
                                .blur(radius: ((cat == topmostCat) || (selectedCat == nil)) ? 0 : 5)
                        }
                        
                    }.padding()
                }
               .frame(maxHeight: 200)
                
                
                Spacer()
            }
            
            if selectedCat != nil {
                
                CatView(namespace: namespace, selectedCat: $selectedCat)
                    .zIndex(2)
                
            }
            
        }.onChange(of: selectedCat, perform: { value in
            //this is needed to keep the disappearing overlay view on top
            // of the other views in the Foreach
            topmostCat = value
        })
    }
}

struct CatCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CatCollectionView()
    }
}


