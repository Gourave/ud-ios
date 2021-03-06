import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainViewControllerDelegate {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    
    
    // MARK: Properties
    
    var definitions = [Definition]()
    let definitionCellId = "DefinitionCell"
    let definitionCellHeight: CGFloat = 256
    
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = definitionCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let definitionNib = UINib(nibName: definitionCellId, bundle: nil)
        tableView.registerNib(definitionNib, forCellReuseIdentifier: definitionCellId)
        
        Service.getRandomWord({
            (result) -> () in
            
            guard result.count > 0 else {
                return
            }
            
            self.definitions = result
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    
    @IBAction func search(sender: AnyObject) {
        guard let word = searchField.text else {
            return
        }

        searchFor(word)
    }
    
    
    // MARK: Internal methods
    
    internal func searchFor(word: String) {
        Service.getDefinition(word, completion: {
            (result) -> () in
            
            guard result.count > 0 else {
                return
            }
            
            self.definitions = result
            self.searchField.text = ""
            self.tableView.reloadData()
        })
    }
    
    
    // MARK: TableView methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return definitions.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = tableView.backgroundColor
        return view
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
        
        // Set cells delegate
        definitionCell!.delegate = self
        
        // Populate view outlets
        definitionCell!.word.text = definition.word!
        definitionCell!.definition.text = definition.definition!
        definitionCell!.authorName.text = "By \(definition.author!)"
        definitionCell!.thumbsUp.text = "\(definition.thumbsUp!)"
        definitionCell!.thumbsDown.text = "\(definition.thumbsDown!)"
        
        return definitionCell!
    }
    
}

