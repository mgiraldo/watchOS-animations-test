//
//  FrameLoader.swift
//  watchSample
//
//  Created by Mauricio Giraldo on 2/5/16.

//

import Foundation

class FrameLoader {
    static func loadFrames()-> Array<NSData> {
        let frame1 = FrameLoader.getFile("1")
        let frame2 = FrameLoader.getFile("2")
        let frame3 = FrameLoader.getFile("3")
        let frame4 = FrameLoader.getFile("4")
        let frame5 = FrameLoader.getFile("5")
        let frame6 = FrameLoader.getFile("6")
        var frames = [NSData]()
        frames.append(frame1)
        frames.append(frame2)
        frames.append(frame3)
        frames.append(frame4)
        frames.append(frame5)
        frames.append(frame6)
        return frames
    }
    
    static func getFile(name:String)-> NSData {
        let bundles = NSBundle.allBundles()
        
        var file : NSData?
        
        for bundle in bundles {
            if let resourcePath = (bundle).pathForResource(name, ofType: "png") {
                file = NSData(contentsOfFile: resourcePath)
                return file!
            }
        }
        
        return file!
    }
}