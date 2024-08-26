//
//  ContentView.swift
//  RepCard_Photos
//
//  Created by apple on 26/08/24.

import SwiftUI

struct ContentView: View {
    func imageURL(seed: String, width: Int, height: Int) -> URL {
        return URL(string: "https://picsum.photos/seed/\(seed)/\(width)/\(height)")!
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<5000) { index in
                        let seed = (index % 32) + 1
                        Grid {
                            GridRow {
                                NavigationLink(destination: DetailView(imageURL: imageURL(seed: "\(seed)", width: 600, height: 300))) {
                                    CachedAsyncImage(url: imageURL(seed: "\(seed)", width: 600, height: 300))
                                }
                                .gridCellColumns(3)
                            }
                            GridRow {
                                NavigationLink(destination: DetailView(imageURL: imageURL(seed: "\(seed + 1)", width: 200, height: 300))) {
                                    CachedAsyncImage(url: imageURL(seed: "\(seed + 1)", width: 200, height: 300))
                                }
                                NavigationLink(destination: DetailView(imageURL: imageURL(seed: "\(seed + 2)", width: 400, height: 300))) {
                                    CachedAsyncImage(url: imageURL(seed: "\(seed + 2)", width: 400, height: 300))
                                }
                                .gridCellColumns(2)
                            }
                            GridRow {
                                NavigationLink(destination: DetailView(imageURL: imageURL(seed: "\(seed + 3)", width: 200, height: 300))) {
                                    CachedAsyncImage(url: imageURL(seed: "\(seed + 3)", width: 200, height: 300))
                                }
                                NavigationLink(destination: DetailView(imageURL: imageURL(seed: "\(seed + 4)", width: 200, height: 300))) {
                                    CachedAsyncImage(url: imageURL(seed: "\(seed + 4)", width: 200, height: 300))
                                }
                                NavigationLink(destination: DetailView(imageURL: imageURL(seed: "\(seed + 5)", width: 200, height: 300))) {
                                    CachedAsyncImage(url: imageURL(seed: "\(seed + 5)", width: 200, height: 300))
                                }
                            }
                            GridRow {
                                NavigationLink(destination: DetailView(imageURL: imageURL(seed: "\(seed + 6)", width: 400, height: 300))) {
                                    CachedAsyncImage(url: imageURL(seed: "\(seed + 6)", width: 400, height: 300))
                                }
                                .gridCellColumns(2)
                                NavigationLink(destination: DetailView(imageURL: imageURL(seed: "\(seed + 7)", width: 200, height: 300))) {
                                    CachedAsyncImage(url: imageURL(seed: "\(seed + 7)", width: 200, height: 300))
                                }
                            }
                        }
                        .frame(minHeight: 760)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
