import Foundation
import Alamofire

class Service {
    
    
    // MARK: Typealias
    
    typealias Completion = ([Definition]) -> ()
    
    
    // MARK: Constants
    
    internal static let baseDefinitionUrl = "http://api.urbandictionary.com/v0/define"
    internal static let randomUrl = "http://api.urbandictionary.com/v0/random"
    
    
    // MARK: Internal Static Methods
    
    internal static func getDefinition(word: String, completion: Completion) {
        Alamofire.request(.GET, Service.baseDefinitionUrl, parameters: ["term" : word]).responseJSON(completionHandler: {
            response in
            
            if let root = response.result.value {
                var definitions = [Definition]()
                
                let rootList = root["list"] as? [Dictionary<String, AnyObject>]
                
                for responseData in rootList! {
                    definitions.append(parseJsonData(responseData))
                }
                completion(definitions)
            }
        })
    }
    
    internal static func getRandomWord(completion: Completion) {
        Alamofire.request(.GET, Service.randomUrl, parameters: nil).responseJSON(completionHandler: {
            response in
            
            if let root = response.result.value {
                var definitions = [Definition]()
                
                let rootList = root["list"] as? [Dictionary<String, AnyObject>]
                
                for responseData in rootList! {
                    definitions.append(parseJsonData(responseData))
                }
                completion(definitions)
            }
        })
    }
    
    
    // MARK: Private Static Methods
    
    private static func parseJsonData(data: Dictionary<String, AnyObject>) -> Definition {
        let definition = Definition()
        
        definition.word = data["word"] as? String
        definition.author = data["author"] as? String
        definition.definition = data["definition"] as? String
        definition.example = data["example"] as? String
        definition.thumbsUp = data["thumbs_up"] as? Int
        definition.thumbsDown = data["thumbs_down"] as? Int
        definition.permalink = data["permalink"] as? String
        definition.currentVote = data["current_vote"] as? String
        
        return definition
    }
    
}