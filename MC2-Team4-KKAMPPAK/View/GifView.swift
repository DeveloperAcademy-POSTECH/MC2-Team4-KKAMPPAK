//
//  GifView.swift
//  twice
//
//  Created by woozu on 2023/05/11.
//

import Foundation
import SwiftUI
import UIKit

struct GifView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        let gif = UIImage.gifImageWithName(gifName)

        let imageView = UIImageView(image: gif)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(imageView)
        return view

    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

extension UIImage {
    static func gifImageWithName(_ name: String) -> UIImage? {
        guard let bundleURL = Bundle.main.url(forResource: name, withExtension: "gif") else {
            return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            return nil
        }
        return UIImage.gifImageWithData(imageData)
    }
    
    static func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()
        var gifDuration = 0.0
        
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let durationSeconds = UIImage.getFrameDuration(from: source, at: i)
                gifDuration += durationSeconds
                images.append(UIImage(cgImage: cgImage))
            }
        }
        
        let gifImage = UIImage.animatedImage(with: images, duration: gifDuration)
        return gifImage
    }
    
    static func getFrameDuration(from source: CGImageSource, at index: Int) -> Double {
        var frameDuration = 0.1
        guard let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [String: Any] else {
            return frameDuration
        }
        
        if let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any] {
            if let delayTime = gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double {
                frameDuration = delayTime
            } else {
                frameDuration = 0.1
            }
        }
        return frameDuration
    }
}
