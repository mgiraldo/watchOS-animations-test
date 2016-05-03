//
//  ViewController.swift
//  watchSample
//
//  Created by Mauricio Giraldo on 2/5/16.

//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let frameData = FrameLoader.loadFrames()
        var frames = [UIImage]()
        for (_, frame) in frameData.enumerate() {
            let image:UIImage = UIImage(data: frame)!
            frames.append(image)
        }
        // this works fine (1 frame per second)
        self.animatedImage.animationImages = frames
        self.animatedImage.animationDuration = 6
        self.animatedImage.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

