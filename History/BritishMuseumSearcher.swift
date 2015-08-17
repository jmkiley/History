//
//  BritishMuseumSearcher.swift
//  History
//
//  Created by Stuart Hearn on 06/08/2015.
//  Copyright (c) 2015 Cleverlink Ltd. All rights reserved.
//

import UIKit

struct BMAPISearchResults {
    let searchTerm: String
}

class BMAPI {
    
    func searchForTerm(searchTerm: String, completion: (results: BMAPISearchResults?, error: NSError?) -> Void) {
        
    }
    
    private func BMAPISearchURLForSearchTerm(searchTerm:String) -> NSURL {
        let escapedTerm = searchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let URLString = "http://collection.britishmuseum.org/sparql.json?query="
        return NSURL(string: URLString)!
    }
}
