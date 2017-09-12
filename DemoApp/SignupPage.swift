//
//  SignupPage.swift
//  DemoApp
//
//  Created by appinventiv on 11/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class SignupPage: UIViewController {
    // variables declaration
    var name:String = ""
    var country:String = ""
    var state:String = ""
    var city:String = ""
    var phoneno:String = ""
    var username:String = ""
    var emailid:String = ""
    var password:String = ""
    var dictData = [String:Any]()
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var phonenoTextField: UITextField!
    
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var emailIdTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signupButton(_ sender: UIButton) {
        name = nameTextField.text!
        country = countryTextField.text!
        state = stateTextField.text!
        city = cityTextField.text!
        phoneno = phonenoTextField.text!
        username = usernameTextfield.text!
        emailid = emailIdTextField.text!
        password = passwordTextField.text!
        fetchDataFromApi()
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "DataShowId") as! DataShow
       // print(self.newDict)
        obj.name = self.dictData["Name"]
        obj.country = self.dictData["Country"]
        obj.state = self.dictData["state"]
        obj.city = self.dictData["city"]
        obj.phoneno = self.dictData["phoneno"]
        obj.username = self.dictData["username"]
        obj.emailid = self.dictData["emailid"]
        obj.password = self.dictData["password"] 
        self.navigationController?.pushViewController(obj, animated: true)
    }
        
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func fetchDataFromApi(){
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "postman-token": "6b1669f2-56f4-e0de-f92e-abd1b488bf21"
        ]
        
        let postData = NSMutableData(data: "Name=\(name)".data(using: String.Encoding.utf8)!)
        postData.append("&Country=\(country)".data(using: String.Encoding.utf8)!)
        postData.append("&state=\(state)".data(using: String.Encoding.utf8)!)
        postData.append("&city=\(city)".data(using: String.Encoding.utf8)!)
        postData.append("&phoneno=\(phoneno)".data(using: String.Encoding.utf8)!)
        postData.append("&username=\(username)".data(using: String.Encoding.utf8)!)
        postData.append("&emailid=\(emailid)".data(using: String.Encoding.utf8)!)
        postData.append("&password=\(password)".data(using: String.Encoding.utf8)!)
        let request = NSMutableURLRequest(url: NSURL(string: "https://httpbin.org/post")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                let responseData = String(data:data!, encoding: .utf8)!
                print(responseData)
                let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
                
                guard let dict = json as? [String:Any] else {
                    return
                }
                
                guard let form = dict["form"] as? [String:Any] else { return }
                 self.dictData = form
                guard let Name = form["Name"] as? String else { return }
                
                print("My Id is \(Name)")
            }
            
            
        })
        
        dataTask.resume()
    }
  
}








