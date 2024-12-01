import SwiftUI
import VisionKit

struct InsurancePage: View {
    @State private var showClaimForm = false
    @State private var showCoverageEstimator = false
    @State private var showScheduleReminder = false
    @State private var showChatbot = false
    @State private var showScanner = false
    
    var body: some View {
        ZStack {
            VStack {
                // Title
                Text("Vision Insurance")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                    .padding(.top)
                
                // Policy Overview Section
                VStack(alignment: .leading) {
                    Text("Manage your policy")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding([.top, .bottom], 10)
                    
                    // Policy Info
                    HStack {
                        Image(systemName: "doc.text.fill")
                            .font(.title)
                            .foregroundColor(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                        Text("View your policy details")
                            .font(.body)
                            .foregroundColor(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                        Spacer()
                        Image(systemName: "chevron.right.circle.fill")
                            .foregroundColor(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                    }
                    .padding(.horizontal)
                    .onTapGesture {
                        // Navigate to policy details page (implementation needed)
                    }
                    
                    Divider()
                        .padding(.vertical)
                }
                
                // Claim Filing Section
                VStack(alignment: .leading) {
                    Text("File a Claim")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding([.top, .bottom], 10)
                    
                    Button(action: {
                        self.showScanner.toggle()
                    }) {
                        HStack {
                            Image(systemName: "square.and.pencil")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("Start New Claim")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                        .cornerRadius(8)
                    }
                    .sheet(isPresented: $showScanner) {
                        DocumentScannerView()
                    }
                    
                    Divider()
                        .padding(.vertical)
                }
                
                // Coverage Estimator Section
                VStack(alignment: .leading) {
                    Text("Estimate Your Coverage")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding([.top, .bottom], 10)
                    
                    Button(action: {
                        self.showCoverageEstimator.toggle()
                    }) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("Estimate Now")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                        .cornerRadius(8)
                    }
                    .sheet(isPresented: $showCoverageEstimator) {
                        Text("Coverage Estimator goes here") // Replace with actual estimator view
                    }
                    
                    Divider()
                        .padding(.vertical)
                }
                
                // Schedule Eye Exam Reminder Section
                VStack(alignment: .leading) {
                    Text("Schedule Your Eye Exam")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding([.top, .bottom], 10)
                    
                    Button(action: {
                        self.showScheduleReminder.toggle()
                    }) {
                        HStack {
                            Image(systemName: "calendar")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("Set a Reminder")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                        .cornerRadius(8)
                    }
                    .sheet(isPresented: $showScheduleReminder) {
                        Text("Schedule reminder form goes here") // Replace with actual reminder form view
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .navigationBarTitle("Insurance Options", displayMode: .inline)
            
            // Floating Chatbot Icon
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.showChatbot.toggle()
                    }) {
                        Image(systemName: "message.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                    .padding()
                    .sheet(isPresented: $showChatbot) {
                        // Chatbot Interface with introductory message
                        ChatbotInterface()
                    }
                }
            }
        }
    }
}

struct DocumentScannerView: UIViewControllerRepresentable {
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            // Handle the scanned document (for example, extract text or process it)
            controller.dismiss(animated: true, completion: nil)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            controller.dismiss(animated: true, completion: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        return VNDocumentCameraViewController()
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
}

struct ChatbotInterface: View {
    @State private var userInput = ""
    @State private var conversation: [String] = ["Hi! How can I assist you with your insurance today?"]

    var body: some View {
        VStack {
            ScrollView {
                ForEach(conversation, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(message.contains("How can I assist") ? Color.gray.opacity(0.1) : Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding(.top, 10)
            
            HStack {
                TextField("Ask me about your insurance...", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    if !userInput.isEmpty {
                        conversation.append(userInput)
                        conversation.append("I'm here to help you with your insurance queries.")
                        userInput = ""
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                        .padding(.trailing)
                        .foregroundColor(Color(hue: 0.614, saturation: 0.403, brightness: 1.0))
                }
            }
            .padding()
        }
        .navigationTitle("AI Chatbot")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InsurancePage_Previews: PreviewProvider {
    static var previews: some View {
        InsurancePage()
    }
}
