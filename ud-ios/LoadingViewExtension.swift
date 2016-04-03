import UIKit

protocol LoadingViewDelegate {
    func showLoadingView()
    func hideLoadingView()
}

extension UIViewController: LoadingViewDelegate {
    internal func showLoadingView() {
        // TODO: FIX LOADING VIEW
        let loadingView = LoadingView.getSingleton(self.view.frame)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.alpha = 0
        
        self.view.addSubview(loadingView)
        self.view.bringSubviewToFront(loadingView)
        
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|[loadingView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["loadingView" : loadingView])
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[loadingView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["loadingView" : loadingView])
        
        self.view.addConstraints(verticalConstraint)
        self.view.addConstraints(horizontalConstraint)
        
        self.view.updateConstraints()
        
        loadingView.show()
    }
    
    internal func hideLoadingView() {
        LoadingView.getSingleton(self.view.frame).hide()
    }
}