import Foundation
import Alamofire

class Service {
    
    
    // MARK: Constants
    
    internal static let baseDefinitionUrl = "http://api.urbandictionary.com/v0/define"
    internal static let randomUrl = "http://api.urbandictionary.com/v0/random"
    
    
    // MARK: Methods
    
    internal static func getDefinition(word: String) {
        Alamofire.request(.GET, Service.baseDefinitionUrl, parameters: ["term" : word]).responseJSON(completionHandler: {
            response in
            
            // TODO: Parse JSON here
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            
        })
    }
    
    internal static func getRandomWord() {
        
        var definitions = [Definition]()
        
        Alamofire.request(.GET, Service.randomUrl, parameters: nil).responseJSON(completionHandler: {
            response in
            
            // TODO: Parse JSON here
            if let root = response.result.value {
                let rootList = root["list"] as? [Dictionary<String, AnyObject>]
                
                
                for responseData in rootList! {
                    let definition = Definition()
                
                    definition.word = responseData["word"] as? String
                    
                    
                    definitions.append(definition)
                }
                
                
            }
        })
        
        // Tight poll and wait for call to finish
        //while !isComplete {}
        
        //return definitions
    }
    
}