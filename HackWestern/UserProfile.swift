import SwiftUI

struct UserProfile: View {
    @State private var username: String = "Kirpa Chandok"
    @State private var email: String = "kirpa@gmail.com"
    @State private var insuranceProvider: String = ""
    @State private var insuranceNumber: String = ""
    
    var body: some View {
        NavigationView { // Ensure navigation view is here
            VStack {
                // Profile Picture
                Image(systemName: "person.circle.fill") // Replace with actual image if available
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 40)

                // Username or additional information
                Text(username)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 20)
                
                Text(email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 5)

                Divider()
                    .padding(.vertical, 20)

                // Scan Prescription Button
                NavigationLink(destination: ScanPrescription()) {
                    Text("Scan Prescription")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)

                Divider()
                    .padding(.vertical, 20)
                
                // Insurance Information Form
                Form {
                    Section(header: Text("Insurance Information")) {
                        // Insurance Provider Picker
                        Picker("Insurance Provider", selection: $insuranceProvider) {
                            Text("SunLife").tag("SunLife")
                            Text("Provider 2").tag("Provider 2")
                            Text("Provider 3").tag("Provider 3")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(.vertical, 5)

                        // Insurance Number Field
                        TextField("Insurance Number", text: $insuranceNumber)
                            .keyboardType(.numberPad)
                            .padding(.vertical, 5)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }

                // Navigation Link for Submit Button
                NavigationLink(destination: InsurancePage()) {
                    Text("Submit")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
            }
            .navigationTitle("User Profile")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    UserProfile()
}
