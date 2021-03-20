//
//  Utilities.swift
//  iprotechs_Task
//
//  Created by SANKAR on 20/03/21.
//

import Foundation
class Utilities{
    static let shared = Utilities()
    func saveUserDefault(userCredential:Any,objectKey:String){
        let defaults = UserDefaults.standard
        defaults.set(userCredential, forKey: objectKey)
    }
    
    func getUserDefault(objectKey: String ) -> Any {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: objectKey) as Any
    }
    func removeObjectBasedOnKey(objectKey: String ){
        UserDefaults.standard.removeObject(forKey:objectKey)
    }
    func removeAllUserDefaultsData(){
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
