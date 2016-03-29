import Foundation
import Alamofire

class Service {
    
    
    // MARK: Constants
    
    let baseDefinitionUrl = "http://api.urbandictionary.com/v0/define"
    let randomUrl = "http://api.urbandictionary.com/v0/random"
    
    
    // MARK: Methods
    
    public func getDefinition(word: String, completion: () -> ()) {
        Alamofire.request(.GET, baseDefinitionUrl, parameters: ["term" : word]).responseJSON(completionHandler: {
            response in
            
            completion()
        })
    }
}