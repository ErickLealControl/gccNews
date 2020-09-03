//
//  User.swift
//  gccNews
//
//  Created by Erick Emmanuel Tamez Leal on 01/09/20.
//  Copyright © 2020 Erick Emmanuel Tamez Leal. All rights reserved.
//

import Foundation
import FirebaseAuth

class User{
    var Email: String = ""
    var Password: String = ""
    var Uid: String = ""
    var hasError: Bool = false
    
    public func User(_email: String, _password:String){
        Email = _email
        Password = _password
    }
    
    public func isValid() -> Bool{
        if(self.Email == ""){
            return false
        }else if (self.Password == ""){
            return false
        }else{
            return true
        }
    }
    public init(){
        
    }
    func signin(completion: (_ result: Bool) -> Void) {
    
            Auth.auth().createUser(withEmail: self.Email, password: self.Password){
            (user,error) in
            
            if error == nil{
                self.hasError = false
            }else{
                print(error)
                self.hasError = true
            }
        }
        completion(self.hasError);
    }
}

