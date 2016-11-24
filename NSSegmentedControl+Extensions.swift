import Cocoa

extension NSSegmentedControl {
    // -------------------------------------------------------------------------------
    //	NSSegmentedControl category to unselect all segments.
    //
    //	NSSegmentedControl won't unselect all segments if there is currently one
    //	segment selected.  So you have to go into the "Momentary tracking mode", unselect
    //	each of the cells, then go back to its original mode.
    // -------------------------------------------------------------------------------
    func unselectAllSegments() {
        let current: NSSegmentSwitchTracking = self.trackingMode
        self.trackingMode = NSSegmentSwitchTracking.momentary
        for i in 0..<self.segmentCount {
            self.setSelected(false, forSegment: i)
        }
        self.trackingMode = current
    }
}
