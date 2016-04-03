import UIKit

class LoadingView: UIView {
    
    private static var loadingView: LoadingView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Animates the loading view into the superview
    internal func show() {
        UIView.animateWithDuration(0.5, animations: {
            self.alpha = 1
        })
    }
    
    // Animates and removes the loading view from the superview
    internal func hide() {
        UIView.animateWithDuration(0.5, animations: {
            self.alpha = 0
        },
        completion: {
            success in
            self.removeFromSuperview()
        })
    }
    
    // Returns a singleton 
    internal static func getSingleton(frame: CGRect) -> LoadingView {
        if loadingView == nil {
            loadingView = LoadingView(frame: frame)
        }
        
        return loadingView!
    }

}
