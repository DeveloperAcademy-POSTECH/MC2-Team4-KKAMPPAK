//
//  EyeMoving.swift
//  MC2-Team4-KKAMPPAK
//
//  Created by yusang on 2023/05/04.
//

import SwiftUI
import RealityKit
import ARKit

struct EyeMovingARViewContainer: UIViewRepresentable {
    @Binding var mode: Int

    @Binding var isLeftCompleted: Bool
    @Binding var isRightCompleted: Bool
    @Binding var isUpCompleted: Bool
    @Binding var isDownCompleted: Bool
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARFaceTrackingConfiguration()
        
        config.isWorldTrackingEnabled = false
        config.isLightEstimationEnabled = true
        
        arView.session.run(config, options: [])
        arView.session.delegate =   context.coordinator
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        var parent: EyeMovingARViewContainer?
        
        var leftEyeValue: Double = 0
        var rightEyeValue: Double = 0
        var upLeftEyeValue: Double = 0
        var upRightEyeValue: Double = 0
        var downRightEyeValue: Double = 0
        var downLeftEyeValue: Double = 0
        
        var isStop: Bool = false
    
        init(parent: EyeMovingARViewContainer) {
            self.parent = parent
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            guard let faceAnchor = anchors.first(where: { $0 is ARFaceAnchor }) as? ARFaceAnchor
            else {
                return
            }
            
            leftEyeValue =  faceAnchor.blendShapes[.eyeLookInLeft]!.doubleValue
            rightEyeValue =  faceAnchor.blendShapes[.eyeLookInRight]!.doubleValue
            upLeftEyeValue =  faceAnchor.blendShapes[.eyeLookUpLeft]!.doubleValue
            upRightEyeValue =  faceAnchor.blendShapes[.eyeLookUpLeft]!.doubleValue
            downLeftEyeValue =  faceAnchor.blendShapes[.eyeLookDownRight]!.doubleValue
            downRightEyeValue =  faceAnchor.blendShapes[.eyeLookDownRight]!.doubleValue

            
            if(parent?.mode == 1){
                if !isStop && leftEyeValue > 0.3  {
                    self.isStop = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isStop = false
                    }
                    
                    parent?.$isLeftCompleted.wrappedValue = true
                    parent?.$isRightCompleted.wrappedValue = false
                        
                }
                else if !self.isStop && rightEyeValue > 0.3 {
                    self.isStop = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isStop = false
                    }
                    
                    parent?.$isRightCompleted.wrappedValue = true
                    parent?.$isLeftCompleted.wrappedValue = false
                }
            }
            else{
                if !isStop && upLeftEyeValue > 0.2 && upRightEyeValue > 0.2  {
                    self.isStop = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isStop = false
                    }
                    
                    parent?.$isUpCompleted.wrappedValue = true
                    parent?.$isDownCompleted.wrappedValue = false
                        
                }
                else if !self.isStop && downRightEyeValue > 0.2 && downLeftEyeValue > 0.2 {
                    self.isStop = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isStop = false
                    }
                    
                    parent?.$isDownCompleted.wrappedValue = true
                    parent?.$isUpCompleted.wrappedValue = false
                }
            }
            
        }
    }
}
