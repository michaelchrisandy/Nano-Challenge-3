//
//  LottieView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 11/07/24.
//

import Foundation
import Lottie
import SwiftUI
import UIKit

struct LottieView: UIViewRepresentable {

    var name: String
    var loopMode: LottieLoopMode = .playOnce
    var animationView = LottieAnimationView()
    var completion: (() -> Void)?

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {

        let view = UIView(frame: .zero)
        
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
                    print("Found animation file at path: \(path)")
                    do {
                        let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                        let jsonString = String(data: jsonData, encoding: .utf8)
                        print("JSON content: \(jsonString ?? "Invalid UTF-8 encoding")")
                        if let animation = LottieAnimation.filepath(path) {
                            animationView.animation = animation
                            print("Animation \(name) loaded successfully.")
                        } else {
                            print("Failed to initialize animation \(name) from bundle.")
                        }
                    } catch {
                        print("Error reading JSON file: \(error)")
                    }
                } else {
                    print("Animation file \(name).json not found in bundle.")
                }

        animationView.contentMode = .scaleAspectFit

        animationView.loopMode = loopMode

        animationView.play { (finished) in
                    if finished {
                        completion?() // Trigger the completion callback when animation finishes
                    }
                }

        animationView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(animationView)

        NSLayoutConstraint.activate([

            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),

            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)

        ])

        return view

    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}

}
