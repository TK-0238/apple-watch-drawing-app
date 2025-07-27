import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("お絵描きウォッチ")
                    .font(.headline)
                    .padding()
                
                NavigationLink(destination: DrawingView()) {
                    Text("お絵描きを始める")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}