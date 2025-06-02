//
//  ViewController2.swift
//  SlideshowApp
//
//  Created by haiden1 on 2025/06/01.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var zoomImageView: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomImageView.image = image
        zoomImageView.contentMode = .scaleAspectFit
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
