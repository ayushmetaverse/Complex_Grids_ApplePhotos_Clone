import SwiftUI

class ImageCache {
    static let shared = NSCache<NSURL, UIImage>()
}
