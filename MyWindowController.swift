
import Cocoa

class MyWindowController: NSWindowController {

    //==================================================
    // NSPopUpButton
    // nib based controls
    @IBOutlet var nibBasedPopUpDown: NSPopUpButton!
    @IBOutlet var nibBasedPopUpRight: NSPopUpButton!
    @IBOutlet var popupBox: NSBox!
    @IBOutlet var buttonMenu: NSMenu!
    // code based controls
    @IBOutlet var placeHolder1: NSView!
    // the anchor/reference place for the code-based popup
    var codeBasedPopUpDown = NSPopUpButton()
    @IBOutlet var placeHolder2: NSView!
    var codeBasedPopUpRight = NSPopUpButton()
    
    //==================================================
    // NSButton
    // nib based controls
    @IBOutlet var nibBasedButtonRound: NSButton!
    @IBOutlet var nibBasedButtonSquare: NSButton!
    @IBOutlet var buttonBox: NSBox!
    // code based controls
    @IBOutlet var placeHolder3: NSView!
    var codeBasedButtonRound = NSButton()
    @IBOutlet var placeHolder4: NSView!
    var codeBasedButtonSquare = NSButton()
    
    //==================================================
    // NSSegmentedControl
    // nib based control
    @IBOutlet var nibBasedSegControl: NSSegmentedControl!
    @IBOutlet var segmentBox: NSBox!
    // code based control
    @IBOutlet var placeHolder5: NSView!
    var codeBasedSegmentControl = NSSegmentedControl()

    //==================================================
    // NSMatrix (Radio buttons)
    // nib based control
    @IBOutlet var nibBasedMatrix: NSMatrix!
    @IBOutlet var matrixBox: NSBox!
    // code based control
    @IBOutlet var placeHolder6: NSView!
    var codeBasedMatrix = NSMatrix()
    
    //==================================================
    // NSColorWell
    // nib based control
    @IBOutlet var nibBasedColorWell: NSColorWell!
    @IBOutlet var colorBox: NSBox!
    // code based control
    @IBOutlet var placeHolder7: NSView!
    var codeBasedColorWell = NSColorWell()

    //==================================================
    // NSLevelIndicator
    // nib based control
    @IBOutlet var nibBasedIndicator: NSLevelIndicator!
    @IBOutlet var indicatorBox: NSBox!
    // code based control
    @IBOutlet var placeHolder8: NSView!
    var codeBasedIndicator = NSLevelIndicator()
    @IBOutlet var levelAdjuster: NSStepper!

    //==================================================
    // DropDownButton
    @IBOutlet var dropDownButton: DropDownButton!

    // MARK:- NSPopUpButton
    
    // -------------------------------------------------------------------------------
    //	popupAction:
    //
    //	User chose a menu item from one of the popups.
    //	Note that all four popup buttons share the same action method.
    // -------------------------------------------------------------------------------
    @IBAction func popupAction(_ sender: AnyObject) {
        // menu item chosen: [sender tag];
        
    }
    
    // -------------------------------------------------------------------------------
    //	changePopupState:
    //
    //	Change the given NSPopupButton as "popup" or "pull down" styte.
    // -------------------------------------------------------------------------------
    func changePopupState(_ popup: NSPopUpButton, asPullDown pullDown: Bool) {
        // hide button first to invalidate its old size
        popup.isHidden = true
        popup.displayIfNeeded()
        var buttonFrame: NSRect = popup.frame

        if pullDown {
            // - change the button to pull down style
            // make the popup a larger square to fit the moof image, and move its origin
            buttonFrame.size.height += 36
            buttonFrame.origin.y -= 36
            // update its menu (keep original self.buttonMenu untouched)
            let newMenu = self.buttonMenu.copy() as! NSMenu
            // add the image menu item back to the first menu item
            let menuItem = NSMenuItem(title: "", action: nil, keyEquivalent: "")
            menuItem.image = NSImage(named: "moof")
            newMenu.insertItem(menuItem, at: 0)
            popup.menu = newMenu
        }
        else {
            // - change the button with a popup style
            // shrink the popup down to menu height size and move its origin upwards
            buttonFrame.size.height -= 36
            buttonFrame.origin.y += 36
            // update its menu (keep original self.buttonMenu untouched)
            popup.menu = self.buttonMenu
        }
        (popup.cell! as! NSPopUpButtonCell).pullsDown = pullDown
        // change the button's frame size and make it visible again
        popup.frame = buttonFrame
        popup.isHidden = false
    }
    
    // -------------------------------------------------------------------------------
    //	pullsDownAction:sender
    //
    //	User checked "Pull Down" checkbox to change the popup button's appearance:
    //		1) as a drop down menu, or 2) as popup menu.
    //
    //	This is an example on how to change the attributes of these popup buttons,
    //	so that they appear correctly.
    //
    //	If checkbox is not checked:
    //		Shrink the button height to appear as a popup button.
    //		We also remove the moof image in this casae.
    //	If checkbox is checked:
    //		Make the button square to fit the moof image.
    //		Put back the moof image menu item.
    //
    // -------------------------------------------------------------------------------
    @IBAction func pullsDownAction(_ sender: NSPopUpButton) {
        let pullDown = sender.selectedCell()!.state != 0
        self.changePopupState(codeBasedPopUpDown, asPullDown: pullDown)
        self.changePopupState(codeBasedPopUpRight, asPullDown: pullDown)
        self.changePopupState(nibBasedPopUpDown, asPullDown: pullDown)
        self.changePopupState(nibBasedPopUpRight, asPullDown: pullDown)
    }
    
    // MARK:- NSButton
    
    // -------------------------------------------------------------------------------
    //	setIconPosition:useIcon
    // -------------------------------------------------------------------------------
    func setIconPosition(_ button: NSButton, useIcon: Bool) {
        if useIcon {
            button.imagePosition = NSCellImagePosition.imageLeft
            (button.cell as! NSButtonCell).alignment = NSTextAlignment.left
        }
        else {
            button.imagePosition = NSCellImagePosition.noImage
            (button.cell as! NSButtonCell).alignment = NSTextAlignment.center
        }
    }

    
    // -------------------------------------------------------------------------------
    //	useIconAction:sender
    //
    //	User checked "Use Icon" checkbox - add or remove the moof icon.
    // -------------------------------------------------------------------------------
    @IBAction func useIconAction(_ sender: NSButton) {
        let useIcon = (sender.cell as! NSButtonCell).state == NSOnState
        self.setIconPosition(nibBasedButtonRound, useIcon: useIcon)
        self.setIconPosition(nibBasedButtonSquare, useIcon: useIcon)
        self.setIconPosition(codeBasedButtonRound, useIcon: useIcon)
        self.setIconPosition(codeBasedButtonSquare, useIcon: useIcon)
    }
    
    // -------------------------------------------------------------------------------
    //	buttonAction:sender
    //
    //	User clicked one of the NSButttons.
    //	Note that all four buttons share the same action method.
    // -------------------------------------------------------------------------------
    @IBAction func buttonAction(_ sender: NSButton) {
        NSLog("Button was clicked")
    }
    
    // MARK:- NSSegmentedControl
    
    // -------------------------------------------------------------------------------
    //	segmentAction:sender
    //
    //	User clicked one of the segments.
    //	Note that both segmented controls share the same action method.
    // -------------------------------------------------------------------------------
    @IBAction func segmentAction(_ sender: AnyObject) {
        NSLog("Segment control was clicked")
    }
    
    // -------------------------------------------------------------------------------
    //	unselectAction:sender
    //
    //	User clicked on the button to unselect all segments.
    //	Use our category to NSSegmentedControl to unselect the cells.
    // -------------------------------------------------------------------------------
    @IBAction func unselectAction(_ sender: AnyObject) {
        nibBasedSegControl.unselectAllSegments()
        codeBasedSegmentControl.unselectAllSegments()
    }
    
    // MARK:- NSMatrix
    
    // -------------------------------------------------------------------------------
    //	matrixAction:sender
    //
    //	User clicked one of the radio buttons in the NSMatrix.
    // -------------------------------------------------------------------------------
    @IBAction func matrixAction(_ sender: AnyObject) {
    }
    
    // MARK:- NSColorWell
    
    // -------------------------------------------------------------------------------
    //	colorAction:sender
    //
    //	User clicked one of the NSColorWell.
    // -------------------------------------------------------------------------------
    @IBAction func colorAction(_ sender: AnyObject) {
    }
    
    // MARK:- NSLevelIndicator
    
    // -------------------------------------------------------------------------------
    //	levelAdjustAction:sender
    //
    //	User clicked the up/down arrow to adjust the level.
    // -------------------------------------------------------------------------------
    @IBAction func levelAdjustAction(_ sender: NSLevelIndicator) {
        // change level
        nibBasedIndicator.intValue = sender.intValue
        codeBasedIndicator.intValue = sender.intValue
    }
    
    // -------------------------------------------------------------------------------
    //	levelAction:sender
    //
    //	User clicked on the actual level indicator to change its value.
    // -------------------------------------------------------------------------------
    @IBAction func levelAction(_ sender: AnyObject) {
        
    }
    
    // -------------------------------------------------------------------------------
    //	setStyleAction:sender
    //
    //	User wants to change the level indicator's style.
    // -------------------------------------------------------------------------------
    @IBAction func setStyleAction(_ sender: NSLevelIndicator) {
        let tag = NSLevelIndicatorStyle(rawValue: UInt(sender.selectedCell()!.tag))
        (nibBasedIndicator.cell as! NSLevelIndicatorCell).levelIndicatorStyle = tag!
        (codeBasedIndicator.cell as! NSLevelIndicatorCell).levelIndicatorStyle = tag!
    }
    
    // MARK:- DropDownButton
    
    // -------------------------------------------------------------------------------
    //	dropDownAction:sender
    //
    //	User clicked the DropDownButton.
    // -------------------------------------------------------------------------------
    @IBAction func dropDownAction(_ sender: AnyObject) {
        // Drop down button clicked
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    override func awakeFromNib() {
        var iconImage: NSImage = NSImage(named: "moof")!
        nibBasedButtonRound.image = iconImage
        nibBasedButtonSquare.image = iconImage
        //===============================
        // NSPopupButton
        // update its menu (keep original self.buttonMenu untouched)
        let newMenu = self.buttonMenu.copy() as! NSMenu
        // add the image menu item back to the first menu item
        let menuItem: NSMenuItem = NSMenuItem(title: "", action: nil, keyEquivalent: "")
        menuItem.image = NSImage(named: "moof")
        newMenu.insertItem(menuItem, at: 0)
    
        // create the pull down button pointing DOWN
        var buttonFrame: NSRect = placeHolder1.frame
        codeBasedPopUpDown = NSPopUpButton(frame: buttonFrame, pullsDown: true)
        (codeBasedPopUpDown.cell as! NSPopUpButtonCell).arrowPosition = NSPopUpArrowPosition.arrowAtBottom
        (codeBasedPopUpDown.cell as! NSPopUpButtonCell).bezelStyle = NSBezelStyle.regularSquare
        codeBasedPopUpDown.menu = newMenu
        popupBox.addSubview(codeBasedPopUpDown)
        placeHolder1.removeFromSuperview()
        // we are done with the place holder, remove it from the window

        // create the pull down button pointing RIGHT
        buttonFrame = placeHolder2.frame
        codeBasedPopUpRight = NSPopUpButton(frame: buttonFrame, pullsDown: true)
        (codeBasedPopUpRight.cell as! NSPopUpButtonCell).arrowPosition = NSPopUpArrowPosition.arrowAtBottom
        (codeBasedPopUpRight.cell as! NSPopUpButtonCell).preferredEdge = NSRectEdge.maxX
        // make the popup menu appear to the right
        (codeBasedPopUpRight.cell as! NSPopUpButtonCell).bezelStyle = NSBezelStyle.shadowlessSquare
        codeBasedPopUpRight.menu = newMenu
        (codeBasedPopUpRight.cell as! NSPopUpButtonCell).highlightsBy = NSCellStyleMask.changeGrayCellMask
        popupBox.addSubview(codeBasedPopUpRight)
        placeHolder2.removeFromSuperview()
        // we are done with the place holder, remove it from the window }
        
        // copy the menu again for 'nibBasedPopUpDown' and 'nibBasedPopUpRight' control
        nibBasedPopUpDown.menu = newMenu
        nibBasedPopUpRight.menu = newMenu
        
        // create the rounded button
        buttonFrame = placeHolder3.frame
        codeBasedButtonRound = NSButton(frame: buttonFrame)
        // note: this button we want alternate title and image, so we need to call this:
        codeBasedButtonRound.setButtonType(NSButtonType.momentaryPushIn)
        codeBasedButtonRound.title = "NSButton"
        codeBasedButtonRound.alternateTitle = "(pressed)"
        codeBasedButtonRound.image = iconImage
        codeBasedButtonRound.alternateImage = NSImage(named: "moof2")
        codeBasedButtonRound.bezelStyle = .regularSquare
        codeBasedButtonRound.imagePosition = .imageLeft
        (codeBasedButtonRound.cell as! NSButtonCell).alignment = NSLeftTextAlignment
        codeBasedButtonRound.font = NSFont.systemFont(ofSize: NSFont.smallSystemFontSize())
        codeBasedButtonRound.sound = NSSound(named: "Pop")
        codeBasedButtonRound.target = self
        codeBasedButtonRound.action = #selector(self.buttonAction)
        
        buttonBox.addSubview(codeBasedButtonRound)
        placeHolder3.removeFromSuperview()
        // we are done with the place holder, remove it from the window }

        // create the square button
        buttonFrame = placeHolder4.frame
        codeBasedButtonSquare = NSButton(frame: buttonFrame)
        codeBasedButtonSquare.title = "NSButton"
        codeBasedButtonSquare.bezelStyle = .shadowlessSquare
        codeBasedButtonSquare.imagePosition = .imageLeft
        (codeBasedButtonSquare.cell as! NSButtonCell).alignment = NSLeftTextAlignment
        codeBasedButtonSquare.image = iconImage
        codeBasedButtonSquare.font = NSFont.systemFont(ofSize: NSFont.smallSystemFontSize())
        codeBasedButtonSquare.sound = NSSound(named:"Pop")
        codeBasedButtonSquare.target = self
        codeBasedButtonSquare.action = #selector(self.buttonAction)
        buttonBox.addSubview(codeBasedButtonSquare)
        placeHolder4.removeFromSuperview()
        // we are done with the place holder, remove it from the window }
        
        //===============================
        // NSSegmentedControl
        // create the segmented control button
        buttonFrame = placeHolder5.frame
        codeBasedSegmentControl = NSSegmentedControl(frame: buttonFrame)
        codeBasedSegmentControl.segmentCount = 3
        codeBasedSegmentControl.setWidth(nibBasedSegControl.width(forSegment: 0), forSegment: 0)
        codeBasedSegmentControl.setWidth(nibBasedSegControl.width(forSegment: 1), forSegment: 1)
        codeBasedSegmentControl.setWidth(nibBasedSegControl.width(forSegment: 2), forSegment: 2)
        codeBasedSegmentControl.setLabel("One", forSegment: 0)
        codeBasedSegmentControl.setLabel("Two", forSegment: 1)
        codeBasedSegmentControl.setLabel("Three", forSegment: 2)
        codeBasedSegmentControl.target = self
        codeBasedSegmentControl.action = #selector(self.segmentAction)
        segmentBox.addSubview(codeBasedSegmentControl)
        placeHolder5.removeFromSuperview()
        // we are done with the place holder, remove it from the window
        // use a menu to the first segment (applied to both nib-based and code-based)
        codeBasedSegmentControl.setMenu(self.buttonMenu, forSegment: 0)
        nibBasedSegControl.setMenu(self.buttonMenu, forSegment: 0)
        // add icons to each segment (applied to both nib-based and code-based)
        iconImage = NSWorkspace.shared().icon(forFileType: NSFileTypeForHFSTypeCode(OSType(kComputerIcon)))
        iconImage.size = NSMakeSize(16, 16)
        nibBasedSegControl.setImage(iconImage, forSegment: 0)
        codeBasedSegmentControl.setImage(iconImage, forSegment: 0)
        iconImage = NSWorkspace.shared().icon(forFileType: NSFileTypeForHFSTypeCode(OSType(kDesktopIcon)))
        iconImage.size = NSMakeSize(16, 16)
        nibBasedSegControl.setImage(iconImage, forSegment: 1)
        codeBasedSegmentControl.setImage(iconImage, forSegment: 1)
        iconImage = NSWorkspace.shared().icon(forFileType: NSFileTypeForHFSTypeCode(OSType(kFinderIcon)))
        iconImage.size = NSMakeSize(16, 16)
        nibBasedSegControl.setImage(iconImage, forSegment: 2)
        codeBasedSegmentControl.setImage(iconImage, forSegment: 2)
        
        
        //===============================
        // NSMatrix
        // first create a radio cell prototype
        let radioCell = NSButtonCell()
        radioCell.setButtonType(.radio)
        radioCell.title = "RadioCell"
        // create the NSMatrix
        buttonFrame = placeHolder6.frame
        codeBasedMatrix = NSMatrix(frame: buttonFrame, mode: .radioModeMatrix, prototype: radioCell, numberOfRows: 2, numberOfColumns: 1)
        // add the cells to the matrix
        var cellToChange: NSCell = codeBasedMatrix.cell(atRow: 0, column: 0)!
        cellToChange.title = "Radio 1"
        cellToChange = codeBasedMatrix.cell(atRow: 1, column: 0)!
        cellToChange.title = "Radio 2"
        codeBasedMatrix.target = self
        codeBasedMatrix.action = #selector(self.matrixAction)
        matrixBox.addSubview(codeBasedMatrix)
        placeHolder6.removeFromSuperview()
        // we are done with the place holder, remove it from the window }

        //===============================
        // NSColorWell
        buttonFrame = placeHolder7.frame
        codeBasedColorWell = NSColorWell(frame: buttonFrame)
        codeBasedColorWell.color = NSColor.blue
        colorBox.addSubview(codeBasedColorWell)
        codeBasedColorWell.action = #selector(self.colorAction)
        placeHolder7.removeFromSuperview()
        // we are done with the place holder, remove it from the window
        //===============================
        // NSLevelIndicator
        buttonFrame = placeHolder8.frame
        codeBasedIndicator = NSLevelIndicator(frame: buttonFrame)
        codeBasedIndicator.maxValue = 10
        codeBasedIndicator.numberOfMajorTickMarks = 4
        codeBasedIndicator.numberOfTickMarks = 7
        codeBasedIndicator.warningValue = 5
        codeBasedIndicator.criticalValue = 8
        (codeBasedIndicator.cell as! NSLevelIndicatorCell).levelIndicatorStyle = .discreteCapacityLevelIndicatorStyle
        codeBasedIndicator.action = #selector(self.levelAction)
        indicatorBox.addSubview(codeBasedIndicator)
        placeHolder8.removeFromSuperview()
        // we are done with the place holder, remove it from the window
        // we are done with the place holder, remove it from the window

    }
    
}
