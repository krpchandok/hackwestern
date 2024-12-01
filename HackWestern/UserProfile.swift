//
//  UserProfile.swift
//  HackWestern
//
//  Created by Kirpa Chandok on 2024-11-30.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        VStack {
            // Profile Picture
            Image(systemName: "person.circle.fill") // Replace with actual image if available
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.top, 40)

            // Username or additional information
            Text("Kirpa Chandok") // Replace with dynamic data
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            Text("User Email: kirpa@example.com") // Replace with dynamic data
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 5)

            Divider()
                .padding(.vertical, 20)
            
            // Navigation to Scan Prescription
            NavigationLink(destination: ScanPrescription()) {
                Text("Scan Prescription")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .navigationTitle("User Profile")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    UserProfile()
}
