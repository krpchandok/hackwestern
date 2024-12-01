//
//  ScanPrescription.swift
//  HackWestern
//
//  Created by Kirpa Chandok on 2024-12-01.
//

import SwiftUI

struct ScanPrescription: View {
    var body: some View {
        VStack {
            Text("Virtual Try-On")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // You can add more UI elements for the virtual try-on here
            Text("Try our AI Glasses Reccomender")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()

            Image(systemName: "eye")
                .font(.system(size: 100))
                .foregroundColor(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                .padding()
        }
        .navigationBarTitle("Virtual Try-On", displayMode: .inline)
    }
}

#Preview {
    ScanPrescription()
}
