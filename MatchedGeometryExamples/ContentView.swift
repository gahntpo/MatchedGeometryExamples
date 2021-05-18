//
//  ContentView.swift
//  MatchedGeometryExamples
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            AdaptiveCatView()
                .tag(0)
                .tabItem {
                    Image(systemName: "arrowshape.zigzag.forward")
                    Text("Swop position") }
            
            CatCollectionView()
                .tag(1)
                .tabItem {
                    Image(systemName: "star")
                    Text("Hero") }
            
            PickerExamples()
                .tag(2)
                .tabItem {
                    Image(systemName: "lasso")
                    Text("Picker") }
            
            
            EmojisPicker()
                .tag(3)
                .tabItem {
                    Image(systemName: "eyedropper")
                    Text("Hero picker") }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
