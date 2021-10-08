//
//  ContentView.swift
//  swiftUIAsyncImage
//
//  Created by Geadalfa Giyanda on 08/10/21.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        // MARK: - 1. BASIC
        
        //AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. SECOND
        
        //AsyncImage(url: URL(string: imageURL), scale: 3.0) //angka lebih besar maka image semakin kecil
        
        // MARK: - 3. PLACEHOLDER
        
        AsyncImage(url: URL(string: imageURL)) {image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 128)
                .foregroundColor(.blue)
                .opacity(0.5)
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
