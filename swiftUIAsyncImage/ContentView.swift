//
//  ContentView.swift
//  swiftUIAsyncImage
//
//  Created by Geadalfa Giyanda on 08/10/21.
//

import SwiftUI

extension Image{
    func ImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View{
        self
            .ImageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.blue)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        // MARK: - 1. BASIC
        
        //AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. SECOND
        
        //AsyncImage(url: URL(string: imageURL), scale: 3.0) //angka lebih besar maka image semakin kecil
        
        // MARK: - 3. PLACEHOLDER
        
        /*
        AsyncImage(url: URL(string: imageURL)) {image in
            image.ImageModifier()
                
        } placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        .padding(40)
         */
        
        // MARK: - 4. PHASE
        /*
        AsyncImage(url: URL(string: imageURL)) {phase in
            // SUCCESS: The image sucessfully loaded.
            // FAILURE: The image failed to load with an error.
            // EMPTY: No image is loaded.
            
            if let image = phase.image{
                image.ImageModifier()
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            } else {
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)
        */
        
        // MARK: - 5. ANIMATION
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image
                    .ImageModifier()
                    //.transition(.move(edge: .bottom))
                    //.transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
