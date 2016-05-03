//
//  AppDelegate.swift
//  watchSample
//
//  Created by Mauricio Giraldo on 2/5/16.

//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var session: WCSession? {
        didSet {
            if let session = session {
                session.delegate = self
                session.activateSession()
            }
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if WCSession.isSupported() {
            session = WCSession.defaultSession()
        }
        
        return true
    }


}

extension AppDelegate: WCSessionDelegate {
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        print(message)
        if let reference = message["hello"] as? String {
            print(reference)
            let bundle = NSBundle.mainBundle()
            let frame1 = NSData(contentsOfFile: bundle.pathForResource("1", ofType: "png")!)
            let frame2 = NSData(contentsOfFile: bundle.pathForResource("2", ofType: "png")!)
            let frame3 = NSData(contentsOfFile: bundle.pathForResource("3", ofType: "png")!)
            let frame4 = NSData(contentsOfFile: bundle.pathForResource("4", ofType: "png")!)
            let frame5 = NSData(contentsOfFile: bundle.pathForResource("5", ofType: "png")!)
            let frame6 = NSData(contentsOfFile: bundle.pathForResource("6", ofType: "png")!)
            var frames = [NSData]()
            frames.append(frame1!)
            frames.append(frame2!)
            frames.append(frame3!)
            frames.append(frame4!)
            frames.append(frame5!)
            frames.append(frame6!)
            print(frames)
            replyHandler(["frames": frames])
        }
    }
    
}
