import SwiftUI

struct DrawingView: View {
    @State private var lines: [Line] = []
    @State private var currentColor: Color = .blue
    @State private var showColorPicker = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    showColorPicker.toggle()
                }) {
                    Circle()
                        .fill(currentColor)
                        .frame(width: 20, height: 20)
                }
                
                Spacer()
                
                Button("クリア") {
                    lines.removeAll()
                }
                .foregroundColor(.red)
                .font(.system(size: 12))
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    if let firstPoint = line.points.first {
                        path.move(to: firstPoint)
                        for point in line.points.dropFirst() {
                            path.addLine(to: point)
                        }
                    }
                    context.stroke(path, with: .color(line.color), lineWidth: 2)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let newPoint = value.location
                        if let lastLineIndex = lines.indices.last,
                           lines[lastLineIndex].points.last != newPoint {
                            lines[lastLineIndex].points.append(newPoint)
                        }
                    }
                    .onEnded { _ in
                        let newLine = Line(points: [], color: currentColor)
                        lines.append(newLine)
                    }
            )
            .onTapGesture { location in
                let newLine = Line(points: [location], color: currentColor)
                lines.append(newLine)
            }
        }
        .navigationTitle("お絵描き")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showColorPicker) {
            ColorPickerView(selectedColor: $currentColor)
        }
    }
}

struct Line {
    var points: [CGPoint]
    var color: Color
}

struct ColorPickerView: View {
    @Binding var selectedColor: Color
    @Environment(\.dismiss) private var dismiss
    
    let colors: [Color] = [.blue, .red, .green, .yellow, .purple, .orange, .pink, .black]
    
    var body: some View {
        VStack {
            Text("色を選択")
                .font(.headline)
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                ForEach(colors, id: \.self) { color in
                    Button(action: {
                        selectedColor = color
                        dismiss()
                    }) {
                        Circle()
                            .fill(color)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Circle()
                                    .stroke(selectedColor == color ? Color.white : Color.clear, lineWidth: 2)
                            )
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    DrawingView()
}