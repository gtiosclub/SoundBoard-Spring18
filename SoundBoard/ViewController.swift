//
//  ViewController.swift
//  SoundBoard
//
//  Created by Brian Wang on 1/9/18.
//  Copyright © 2018 BW. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var player:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onePressed(_ sender: UIButton) {
        let fileName = "perc 1.wav"
        play(fileName: fileName)
        titleLabel.text = fileName
        titleLabel.textColor = sender.backgroundColor
    }
    @IBAction func twoPressed(_ sender: UIButton) {
        let fileName = "Kick 1.wav"
        play(fileName: fileName)
        titleLabel.text = fileName
        titleLabel.textColor = sender.backgroundColor
    }
    @IBAction func threePressed(_ sender: UIButton) {
        let fileName = "Snare 1.mp3"
        play(fileName: fileName)
        titleLabel.text = fileName
        titleLabel.textColor = sender.backgroundColor
    }
    @IBAction func fourPressed(_ sender: UIButton) {
        let fileName = "hat1.wav"
        play(fileName: fileName)
        titleLabel.text = fileName
        titleLabel.textColor = sender.backgroundColor
    }
    
    func play(fileName: String) {
        let path = Bundle.main.path(forResource: fileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
        player?.play()
    }
}

