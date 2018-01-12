//
//  ViewController.swift
//  SoundBoard
//
//  Created by Brian Wang on 1/9/18.
//  Copyright © 2018 BW. All rights reserved.
//

#if os(iOS)
    import UIKit
#else
    import AppKit
    typealias UIViewController = NSViewController
    typealias UILabel = NSTextField
    typealias UIButton = NSButton
#endif

import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    
    var player:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonColor()
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
    
    func setButtonColor() {
        #if os(macOS)
            self.view.layer?.backgroundColor = NSColor.white.cgColor
            buttonOne.colorString = "pink"
            buttonTwo.colorString = "green"
            buttonThree.colorString = "yellow"
            buttonFour.colorString = "blue"
        #endif
    }
}

#if os(macOS)
extension NSTextField {
    public var text: String {
        get { return self.stringValue }
        set { self.stringValue = newValue }
    }
}

extension NSButton {
    public var backgroundColor: NSColor {
        get { return NSColor.init(cgColor: (self.layer?.backgroundColor)!)! }
        set { self.layer?.backgroundColor = backgroundColor.cgColor }
    }
    
    public var colorString: String {
        get { return "" }
        set { self.layer?.backgroundColor = NSColor.init(named: NSColor.Name(rawValue: newValue), bundle: nil)?.cgColor }
    }
}
#endif
