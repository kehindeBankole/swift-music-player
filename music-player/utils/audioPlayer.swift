//
//  audioPlayer.swift
//  music-player
//
//  Created by kehinde on 28/01/2024.
//

import Foundation

import AVFoundation

var audioPlayer: AVPlayer?

class PlayerAudio {
    init(sound:String){
        if let url = URL(string: sound) {
            audioPlayer = AVPlayer(url: url)
        }
    }
    func playSound(){
        audioPlayer?.play()
    }
    func pauseSound(){
        
        audioPlayer?.pause()
    }
    
    func getDuration() -> Double{
        return (audioPlayer?.currentItem?.duration.seconds)!
    }
    
    func restart(){
        audioPlayer?.seek(to: .zero)
    }
}
