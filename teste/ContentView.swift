

import SwiftUI

struct ContentView: View {
    let emojis = ["🍋", "🍎", "🍊", "🌽", "🍑", "🍌", "🍍", "🍉", "🍠", "🍓", "🍒", "🌶️"]
    @State var cardsCount: Int = 4
    var body: some View {
        
        VStack{
            cards
            Spacer()
            cardsCountAdjusters
        }
        .padding()
        
    }
    
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardsCount, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(Color.red)
    }
    
    var cardsCountAdjusters : some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjustersBuilder(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardsCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardsCount + offset < 1 || cardsCount + offset > emojis.count)
    }
    
    var cardRemover: some View{
        cardCountAdjustersBuilder(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View{
        cardCountAdjustersBuilder(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isfaceup = true
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(Color.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isfaceup ? 1 : 0)
            base.fill().opacity(isfaceup ? 0 : 1)
            
        }.onTapGesture {
            print("tapped")
            isfaceup.toggle()
        }
    }
}
    
#Preview {
    ContentView()
}

