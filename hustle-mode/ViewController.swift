//
//  ViewController.swift
//  hustle-mode
//
//  Created by VX on 25/07/2017.
//  Copyright © 2017 VXette. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
	
	@IBOutlet weak var darkBlueBG: UIImageView!
	@IBOutlet weak var powerBtn: UIButton!
	@IBOutlet weak var cloudHolder: UIView!
	@IBOutlet weak var rocket: UIImageView!
	@IBOutlet weak var hustle_lbl: UILabel!
	@IBOutlet weak var on_lbl: UILabel!
	
	var player: AVAudioPlayer!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
		let url = URL(fileURLWithPath: path)
		
		do {
			player = try AVAudioPlayer(contentsOf: url)
			player.prepareToPlay()
		} catch let error as NSError {
			print(error.description)
		}
	}
	

	@IBAction func powerBtnPressed(_ sender: UIButton) {
		cloudHolder.isHidden = false
		darkBlueBG.isHidden = true
		powerBtn.isHidden = true
		
		player.play()
		
		UIView.animate(withDuration: 2.3, animations: {
			self.rocket.frame = CGRect(x: 0, y: 200, width: 375, height: 250)
		}) { (finished) in
			self.hustle_lbl.isHidden = false
			self.on_lbl.isHidden = false
		}
	}
	
}

