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
            let frames = FrameLoader.loadFrames()
            print(frames)
            replyHandler(["frames": frames])
        }
    }
    
}
