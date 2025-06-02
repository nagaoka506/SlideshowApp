//
//  ViewController.swift
//  SlideshowApp
//
//  Created by haiden1 on 2025/05/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var timer: Timer?
    var currentIndex = 0
    let images = ["image1.jpg", "image2.jpg", "image3.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: images[currentIndex])
        
        // 拡大遷移用タップジェスチャー
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc func tapImage() {
        performSegue(withIdentifier: "toZoom", sender: nil)
    }
    
    // 次へ
    @IBAction func nextImage(_ sender: Any) {
        currentIndex = (currentIndex + 1) % images.count
        imageView.image = UIImage(named: images[currentIndex])
    }
    
    // 戻る
    @IBAction func prevImage(_ sender: Any) {
        currentIndex = (currentIndex - 1 + images.count) % images.count
        imageView.image = UIImage(named: images[currentIndex])
    }
    
    // 再生/停止
    @IBAction func playPause(_ sender: Any) {
        if timer == nil {
            // 再生開始
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateSlideshow), userInfo: nil, repeats: true)
            playPauseButton.setTitle("停止", for: .normal)
            nextButton.isEnabled = false
            backButton.isEnabled = false
        } else {
            // 停止
            timer?.invalidate()
            timer = nil
            playPauseButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    @objc func updateSlideshow() {
        currentIndex = (currentIndex + 1) % images.count
        imageView.image = UIImage(named: images[currentIndex])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toZoom" {
            let zoomVC = segue.destination as! ViewController2
            zoomVC.image = UIImage(named: images[currentIndex])
            // スライドショーが動作中なら止める
            if timer != nil {
                timer?.invalidate()
                timer = nil
                playPauseButton.setTitle("再生", for: .normal)
                nextButton.isEnabled = true
                backButton.isEnabled = true
            }
        }
    }
}
