//
//  VirtualTryOn.swift
//  HackWestern
//
//  Created by Kirpa Chandok on 2024-11-30.
//

import SwiftUI

struct HostingWindowFinder: UIViewRepresentable{
    var callback: (UIWindow?) -> ()
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async{ [weak view] in
            self.callback(view?.window)
        }
        return view
    }
}

struct VirtualTryOn: View {
    var body: some View {
        Button(action: {
            Unity.shared.show()
        }, label: {
            Text("Try On!")
        })
    };.background(
        HostingWindowFinder {
            window in
            Unity.shared.setHostMainWindow(window)
        }
    )
}

#Preview {
    VirtualTryOn()
}
