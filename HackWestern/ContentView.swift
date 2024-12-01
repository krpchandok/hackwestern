
//  ContentView.swift
//  HackWestern
//
//  Created by Kirpa Chandok on 2024-11-30.
//

//
//  ContentView.swift
//  HackWestern
//
//  Created by Kirpa Chandok on 2024-11-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Hero Section
                    VStack {
                        Text("Find Your Perfect Glasses")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.white)
                            .padding(.top, 10.0)
                            .padding(.horizontal)
                            .background(Color(hue: 0.615, saturation: 0.206, brightness: 1.0))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(hue: 0.615, saturation: 0.206, brightness: 1.0))

                    // Features Section
                    VStack(alignment: .leading) {
                        Text("Features")
                            .font(.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                        
                        HStack {
                            NavigationLink(destination: VirtualTryOn()) {
                                    FeatureItem(imageName: "eye-glasses", title: "Virtual Try-On")
                            }
                            NavigationLink(destination: UserProfile()) {
                                FeatureItem(imageName: "lens", title: "Customize Profile")
                            }
                            NavigationLink(destination: MarketPlace()) {
                                FeatureItem(imageName: "delivery-truck", title: "Online Shop")
                            }
                        }
                    }
                    .padding()

                    // About Section
                    VStack(alignment: .leading) {
                        Text("About Us")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 10)
                        
                        Text("At GlassesApp, we help you find the perfect pair of glasses that fit your style and needs. Our wide selection of frames and lenses ensures you'll find what you're looking for.")
                            .padding(.bottom, 10)
                    }
                    .padding()

                    // Contact Section
                    VStack {
                        Text("Get in Touch")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 10)

                        Button(action: {
                            // Action to contact
                        }) {
                            Text("Contact Us")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                    .padding()

                }
            }
            .navigationBarTitle("GlassesApp", displayMode: .inline)
        }
    }
}

struct FeatureItem: View {
    var imageName: String
    var title: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 20)
                .padding()
            Text(title)
                .font(.headline)
                .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}
