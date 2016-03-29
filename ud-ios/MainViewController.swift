import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Properties
    
    let definitions = [Definition]()
    let definitionCellId = "DefinitionCell"
    let definitionCellHeight: CGFloat = 256
    
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let definitionNib = UINib(nibName: definitionCellId, bundle: nil)
        tableView.registerNib(definitionNib, forCellReuseIdentifier: definitionCellId)
        
        // NOTE: http://api.urbandictionary.com/v0/define?term=kvlt <-- example of api call
        // To get a random definition: http://api.urbandictionary.com/v0/random
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: TableView functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return definitions.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return definitionCellHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Dequeue the reusable cell as a definitionCell
        let definitionCell = tableView.dequeueReusableCellWithIdentifier(definitionCellId) as? DefinitionCell
        
        // Check to see that the cell is not nil
        guard definitionCell != nil else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        let definition = definitions[row]
        
        // Populate view outlets
        definitionCell!.word.text = definition.word!
        definitionCell!.definition.text = definition.definition!
        
        return definitionCell!
    }
    
}
