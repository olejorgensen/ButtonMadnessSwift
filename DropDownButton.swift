import Cocoa

public class DropDownButton : NSButton {
    var popUpCell: NSPopUpButtonCell?
    
    // -------------------------------------------------------------------------------
    //	awakeFromNib:
    // -------------------------------------------------------------------------------
    public override func awakeFromNib() {
        if self.menu != nil {
            self.usesMenu = true
        }
    }

    // -------------------------------------------------------------------------------
    //	usesMenu:
    // -------------------------------------------------------------------------------
    public var usesMenu: Bool {
        get {
            return (popUpCell != nil)
        }
        set {
            if popUpCell == nil && newValue == true {
                popUpCell = NSPopUpButtonCell(textCell: "")
                popUpCell!.pullsDown = true
                popUpCell!.preferredEdge = NSRectEdge.maxY
            } else if popUpCell != nil && newValue == false {
                popUpCell = nil
            }
        }
    }
    
    // -------------------------------------------------------------------------------
    //	runPopUp:theEvent
    // -------------------------------------------------------------------------------
    public func runPopUp(theEvent: NSEvent) {
        // create the menu the popup will use
        let popUpMenu = self.menu!.copy() as! NSMenu
        popUpMenu.insertItem(withTitle: "", action: nil, keyEquivalent: "", at: 0)
        // blank item at top
        popUpCell!.menu = popUpMenu
        // and show it
        popUpCell!.performClick(withFrame: self.bounds, in: self)
        self.needsDisplay = true
    }
    
    // -------------------------------------------------------------------------------
    //	mouseDown:theEvent
    // -------------------------------------------------------------------------------
    public override func mouseDown(with theEvent: NSEvent) {
        if self.usesMenu {
            self.runPopUp(theEvent: theEvent)
        } else {
            super.mouseDown(with: theEvent)
        }
    }

}
