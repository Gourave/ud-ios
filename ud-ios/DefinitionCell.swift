import UIKit

protocol MainViewControllerDelegate {
    func searchFor(word: String)
}

class DefinitionCell: UITableViewCell {
    
    
    // MARK: Properties
    
    internal var delegate: MainViewControllerDelegate?
    
    
    // MARK: Outlets
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var definition: UILabel!
    
    
    // MARK: Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func searchForMultipleDefinitions(sender: AnyObject) {
        delegate?.searchFor(word.text!)
    }
    
    

}
