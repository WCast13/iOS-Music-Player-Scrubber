//
//  ViewController.swift
//  backToBach
//
//  Created by WilliamCastellano on 2/20/17.
//  Copyright © 2017 WilliamCastellano. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  var player = AVAudioPlayer()
  var timer = Timer()
  
  @IBOutlet var volume: UISlider!
  @IBOutlet var songPosition: UISlider!
  
  func updateSongPosition() {
    songPosition.value = Float(player.currentTime)
  }
  
  @IBAction func play2(_ sender: Any) {
    player.play()
    
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateSongPosition), userInfo: nil, repeats: true)
  }
  
  @IBAction func pause(_ sender: Any) {
    player.pause()
    timer.invalidate()
  }
  
  @IBAction func stop(_ sender: Any) {
    timer.invalidate()
    player.currentTime = 0
    player.stop()
  }
  
  @IBAction func volumeSliderChanged(_ sender: Any) {
    player.volume = volume.value
  }
  
  @IBAction func positionSliderChanged(_ sender: Any) {
    
    player.currentTime = TimeInterval(songPosition.value)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  
    let audioPath = Bundle.main.path(forResource: "09 Like We Ain't Ever", ofType: "mp3")
    
    do {
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
      songPosition.maximumValue = Float(player.duration)
    } catch {
//      error
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

