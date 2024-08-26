import SwiftUI

struct CachedAsyncImage: View {
    @State private var uiImage: UIImage? = nil
    let url: URL
    
    var body: some View {
        Group {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            } else {
                Color.gray.opacity(0.3)
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }
    
    private func loadImage() {
        if let cachedImage = ImageCache.shared.object(forKey: url as NSURL) {
            self.uiImage = cachedImage
        } else {
            downloadImage()
        }
    }
    
    private func downloadImage() {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            
            ImageCache.shared.setObject(image, forKey: url as NSURL)
            
            DispatchQueue.main.async {
                self.uiImage = image
            }
        }
        task.resume()
    }
}
