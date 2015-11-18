//
//  AppDelegate.swift
//  tooltip_arrays
//
//  Created by Eric Gorr on 11/18/15.
//  Copyright © 2015 Eric Gorr. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var view:   NSView!
    
    var myArray = [[String:AnyObject]]()
    {
        didSet
        {
            NSLog( "did set" )
        }
    }
    
    override func view(view: NSView, stringForToolTip tag: NSToolTipTag, point: NSPoint, userData data: UnsafeMutablePointer<Void>) -> String
    {
        let pUserData = UnsafeMutablePointer<[String:AnyObject]>(data)
        let userData  = pUserData.memory
        
        return "hello"
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        self.myArray.append( [ "one" : "a" ] )
        self.myArray.append( [ "two" : "b" ] )
        
        view.addToolTipRect( NSMakeRect( 0, 0, 100, 100), owner: self, userData: &(myArray[0]) )
    }
    
    
    
    func applicationWillTerminate(aNotification: NSNotification)
    {
    }
}
