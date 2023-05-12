//
//  MusicView.swift
//  twice
//
//  Created by woozu on 2023/05/11.
//
import Foundation
import SwiftUI
import AVKit

class DDiroringMusicPlayer {
    static let shared = DDiroringMusicPlayer()
    
    var player: AVAudioPlayer?
    
    private init() {}
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "띠로링", withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
}

