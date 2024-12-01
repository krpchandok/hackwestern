//
//  MarketPlace.swift
//  HackWestern
//
//  Created by Kirpa Chandok on 2024-11-30.
//

import SwiftUI

struct Glasses: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Double
    
    var displayedImage: String {
            return image
        }
}

let glassesData = [
    Glasses(name: "Ray-Ban Aviator", image: "rayban", price: 149.99),
    Glasses(name: "Oakley Holbrook", image: "oakley", price: 129.99),
    Glasses(name: "Gucci GG0061S", image: "gucci", price: 350.00),
    Glasses(name: "Prada Linea Rossa", image: "prada", price: 299.99),
    Glasses(name: "Versace VE2161", image: "versace", price: 259.99)
]

struct MarketPlace: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())] // Two columns
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) { // Use LazyVGrid for a grid layout
                    ForEach(glassesData) { glasses in
                        NavigationLink(destination: GlassesDetailView(glasses: glasses)) {
                            GlassesGridItem(glasses: glasses)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Glasses Marketplace")
        }
    }
}

struct GlassesGridItem: View {
    var glasses: Glasses
    
    var body: some View {
        VStack {
            Image(glasses.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                
            
            Text(glasses.name)
                .font(.headline)
                .lineLimit(1)
                .minimumScaleFactor(0.7) // Adjust font size for long text
            
            Text("$\(glasses.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct GlassesDetailView: View {
    var glasses: Glasses
    
    var body: some View {
        ScrollView {
            VStack {
                Image(glasses.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                
                Text(glasses.name)
                    .font(.title)
                    .padding()
                
                Text("$\(glasses.price, specifier: "%.2f")")
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding()
                
                Spacer()
            }
            .navigationTitle(glasses.name)
            .padding()
        }
    }
}

#Preview {
    MarketPlace()
}
