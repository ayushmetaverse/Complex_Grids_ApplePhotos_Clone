import SwiftUI

struct DetailView: View {
    let imageURL: URL
    @Environment(\.dismiss) var dismiss
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            CachedAsyncImage(url: imageURL)
                .scaledToFit()
                .background(Color.black)
                .ignoresSafeArea(edges: .all)
                .offset(y: dragOffset.height)
                .animation(.interactiveSpring(), value: dragOffset)
                .gesture(
                    DragGesture(minimumDistance: 10, coordinateSpace: .local)
                        .onChanged { value in
                            isDragging = true
                            dragOffset = value.translation
                        }
                        .onEnded { value in
                            if dragOffset.height > 100 {
                                withAnimation(.easeOut) {
                                    dragOffset = CGSize(width: 0, height: UIScreen.main.bounds.height)
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    dismiss()
                                }
                            } else {
                                withAnimation(.easeOut) {
                                    dragOffset = .zero
                                }
                            }
                            isDragging = false
                        }
                )
        }
        .onAppear {
            if !isDragging {
                dragOffset = .zero
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imageURL: URL(string: "https://example.com/photo.jpg")!)
    }
}
