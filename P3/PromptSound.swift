//
//  PromptSound.swift
//  Pinyin Comparison
//
//  Created by 文川术 on 4/28/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import AVFoundation


struct PromptSound {
	let right_sound: AVAudioPlayer
	let wrong_sound: AVAudioPlayer

	init() {
		let soundPath_0 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("right", ofType: "caf")!)
		right_sound = try! AVAudioPlayer(contentsOfURL: soundPath_0)

		let soundPath_1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrong", ofType: "caf")!)
		wrong_sound = try! AVAudioPlayer(contentsOfURL: soundPath_1)
	}

	func play(play: Bool, sound: AVAudioPlayer) {
		sound.stop()
		if play {
			sound.currentTime = 0
			sound.volume = 0.8
			sound.prepareToPlay()
			sound.play()
		}
	}
}
