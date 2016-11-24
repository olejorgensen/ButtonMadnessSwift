
import Foundation
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    var myWindowController: MyWindowController!
    
    // -------------------------------------------------------------------------------
    //	openReadMe:sender
    // -------------------------------------------------------------------------------
    @IBAction func openReadMe(sender: AnyObject) {
        let fullPath = Bundle.main.path(forResource: "ReadMe", ofType: "txt")!
        NSWorkspace.shared().openFile(fullPath)
    }
    
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        myWindowController = MyWindowController(windowNibName: "TestWindow")
        myWindowController.showWindow(self)

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

