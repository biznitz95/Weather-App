//
//  ViewController.swift
//  Weather App
//
//  Created by Bizet Rodriguez on 12/4/18.
//  Copyright © 2018 Bizet Rodriguez. All rights reserved.
//

import UIKit
import VideoSplashKit
import AVFoundation
import ChameleonFramework
import PopMenu

class ViewController: VideoSplashViewController {
    @IBOutlet var overlayView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAudio()
        
        setBackground()
        
        setButton()

        addVideo(videoName: "City", videoType: "mp4")
    }
    
    fileprivate func addVideo(videoName name: String, videoType type: String) -> Void {
        guard let myBundle = Bundle.main.path(forResource: name, ofType: type) else {fatalError("Could not find video!")}
        let url = NSURL.fileURL(withPath: myBundle)
        self.videoFrame = view.frame
        self.fillMode = .resizeAspectFill
        self.alwaysRepeat = true
        self.sound = false
        //        self.startTime = 12.0
        //        self.duration = 4.0
        self.alpha = 0.7
        self.backgroundColor = UIColor.black
        self.contentURL = url
        self.restartForeground = true
    }
    
    fileprivate func setAudio() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
    }
    
    fileprivate func setBackground() {
        overlayView.backgroundColor = UIColor.flatNavyBlueColorDark()
    }
    
    fileprivate func setButton() {
        let btn1 = PopMenu(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        btn1.show(at: self.view)
//        btn1.layer.backgroundColor = UIColor.flatRed()?.cgColor
        
//        let menu1 = MenuItem(title: "Pencil", iconName: "pencil")
        
        let menu1 = MenuItem(title: "Pencil", iconName: "pencil", glow: UIColor.flatRed())
        let menu2 = MenuItem(title: "clock", iconName: "clock", glow: UIColor.flatBlue())
        let menu3 = MenuItem(title: "powerButton", iconName: "powerButton", glow: UIColor.flatLime())
        let menu6 = MenuItem(title: "Pencil", iconName: "pencil", glow: UIColor.flatRed())
        let menu5 = MenuItem(title: "clock", iconName: "clock", glow: UIColor.flatBlue())
        let menu4 = MenuItem(title: "powerButton", iconName: "powerButton", glow: UIColor.flatLime())
        
        let items = [menu1, menu2, menu3, menu4, menu5, menu6]
        
        let height: CGFloat = view.frame.size.height
        let width: CGFloat = view.frame.size.width
        let x: CGFloat = 0
        let y: CGFloat = 0
        let popMenu = PopMenu(frame: CGRect(x: x, y: y, width: width, height: height), items: items as [Any])
        popMenu?.backgroundColor = UIColor.clear
        popMenu?.show(at: self.view)
    }
}
