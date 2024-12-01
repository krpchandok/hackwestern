import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Hero Section
                ZStack(alignment: .top) {
                    Image("headerBackground")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 400) // Reduce height to fit content
                        .clipped()

                    Text("Find Your Perfect Glasses with ClearSight AI")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.top, 30)
                }

                // Features Section
                VStack {
                    Text("Features")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)

                    HStack {
                        NavigationLink(destination: VirtualTryOn()) {
                            FeatureItem(title: "Virtual Try-On")
                        }
                        NavigationLink(destination: UserProfile()) {
                            FeatureItem(title: "Customize Profile")
                        }
                        NavigationLink(destination: MarketPlace()) {
                            FeatureItem(title: "Online Market")
                        }
                        // New section for Insurance Information
                        NavigationLink(destination: InsurancePage()) {
                            FeatureItem(title: "Insurance Info")
                        }
                    }
                }
                .padding(.horizontal)

                // Mascot Section
                ZStack {
                    Color.white
                        .ignoresSafeArea()

                    HStack {
                        Image("MascotIcon")
                            .resizable()
                            .frame(width: 70, height: 70, alignment: .center)

                        Text("Hey there! My name is Glint and I am here to make the process of finding glasses with your insurance provider flow seamlessly! Learn more about our features below!")
                            .font(.subheadline)
                    }
                }

                Spacer()
            }
            .navigationBarTitle("GlassesApp", displayMode: .inline)
        }
    }
}

struct FeatureItem: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.blue)
                .padding() // Add padding to ensure text is not cut off
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
        .frame(height: 120) // Ensure the box has enough height to accommodate the text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
