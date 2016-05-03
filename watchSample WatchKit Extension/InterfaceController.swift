//
//  InterfaceController.swift
//  watchSample WatchKit Extension
//
//  Created by Mauricio Giraldo on 2/5/16.

//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {

    @IBOutlet var animationImage: WKInterfaceImage!

    var frames = [UIImage]()
    
    var session: WCSession? {
        didSet {
            if let session = session {
                session.delegate = self
                session.activateSession()
            }
        }
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didAppear() {
        super.didAppear()
        print("hello!")
        if WCSession.isSupported() {
            print("requesting")
            requestAnimations()
        }
    }

    func requestAnimations() {
        session = WCSession.defaultSession()
        session!.sendMessage(["hello":"world"], replyHandler: { (response) -> Void in
            print("received info!")
            print(response)
            if let frameData = response["frames"] as? Array<NSData> {
                print(frameData)
                for (_, frame) in frameData.enumerate() {
                    let image:UIImage = UIImage(data: frame)!
                    self.frames.append(image)
                }
                print("animations: \(self.frames)")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.showAnimation()
                })
            }
            }, errorHandler: { (error) -> Void in
                print("Error \(error)")
        })
    }
    
    func showAnimation() {
        // duration is 6 seconds for 6 frames so each frame should be visible for 1 second
        let animated = UIImage.animatedImageWithImages(self.frames, duration: 6)
        self.animationImage.setImage(animated)
        self.animationImage.startAnimating()
    }

    
}

extension InterfaceController: WCSessionDelegate {
    
}
