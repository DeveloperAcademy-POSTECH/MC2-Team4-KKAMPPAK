//
//  BlinkARViewContainer.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by 김다빈 on 2023/05/09.
//

import ARKit
import RealityKit
import SwiftUI

struct BlinkARViewContainer: UIViewRepresentable {
    @Binding var checkBlink : Bool
    @Binding var anchorEntity : AnchorEntity
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let config = ARFaceTrackingConfiguration()
        
        
        arView.session.run(config, options: [])
        arView.session.delegate = context.coordinator
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
  
}

class Coordinator : NSObject , ARSessionDelegate {
    var parent: BlinkARViewContainer
           
           init(parent: BlinkARViewContainer) {
               self.parent = parent
           }
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
                for anchor in anchors {
                    if let faceAnchor = anchor as? ARFaceAnchor {
                        let leftEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkLeft]?.floatValue ?? 0.0
                        let rightEyeBlinkValue = faceAnchor.blendShapes[.eyeBlinkRight]?.floatValue ?? 0.0
                        
                        if parent.$checkBlink.wrappedValue == false && leftEyeBlinkValue > 0.94 && rightEyeBlinkValue > 0.94 {
                            parent.$checkBlink.wrappedValue = true
                            print("깜빡했나요")
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.2) {
                                self.parent.$checkBlink.wrappedValue = false
                            }
                        }
                            
                    }
                }
        }
}
