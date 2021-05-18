//
//  EmojisPicker.swift
//  MatchedGeometryExamples
//


import SwiftUI


struct Emoji: Identifiable, Hashable {
    let id: UUID = UUID()
    let content: String
    
    static func createDefault() -> [Emoji] {
        let emojis = ["🤓", "🥶", "🅱️", "🖐", "😸", "🎃", "🤩"]
        return emojis.map { Emoji(content: $0) }
    }
}


struct EmojisPicker: View {
    
    let emojis = Emoji.createDefault()
    @State private var selection = [Emoji]()
    @Namespace private var namespace
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("select emoji").font(.title)
            
            ScrollView(.horizontal, showsIndicators: true, content: {
                HStack {
                    Text("Your emojis: ")
                    ForEach(selection) { item in
                        Text(item.content)
                            .foregroundColor(.clear)
                            .matchedGeometryEffect(id: item.id, in: namespace,  isSource: selection.contains(item))
                            
                            
//                            .onTapGesture {
//                                tappedEmoji(item)
//                            }
                    }
                }
                .padding()
            })
            .background(Color.white
                            .cornerRadius(20)
                            .shadow(radius: 10))
            .padding()

            Spacer()
            Divider()
            
            HStack {
                ForEach(emojis) { item in
                    Text(item.content)
                        .matchedGeometryEffect(id: item.id, in: namespace,  isSource: !selection.contains(item))
                        
                        
                        .onTapGesture {
                            withAnimation(.spring()) {
                                tappedEmoji(item)
                            }
                          }
                        .padding(4)
                        .background(Text(item.content).opacity(0.3))
                    
                  }
              }
        }
        .padding()
    }
    
    
    func tappedEmoji(_ emoji: Emoji) {
        if !selection.contains(emoji) {
            selection.append(emoji)
        }else if let  index = selection.firstIndex(of: emoji) {
            selection.remove(at: index)
        }
    }
}

struct EmojisPicker_Previews: PreviewProvider {
    static var previews: some View {
        EmojisPicker()
    }
}
