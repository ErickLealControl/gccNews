//
//  HomeViewController.swift
//  gccNews
//
//  Created by Erick Emmanuel Tamez Leal on 02/09/20.
//  Copyright © 2020 Erick Emmanuel Tamez Leal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var conutryTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    let countries = ["MX",
                     "DE",
                     "ES",
                     "US"
    ]
    let categories = ["bussines","entertainment","health","science","sports","technology"]
    var selectedCountry: String?
    var selectedCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GCC News"
        createCountryPicker()
        createToolbar()
    }
    
    
    func createCountryPicker(){
        let countryPicker = UIPickerView()
        countryPicker.delegate = self
        conutryTextField.inputView = countryPicker
  
        
    }

    
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        conutryTextField.inputAccessoryView = toolBar        
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
extension HomeViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return countries.count
        }else{
            return categories.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return countries[row]
            
        }else{
            return categories[row]
        }
        return countries[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component ==  0
        {
            selectedCountry = countries[row]
            conutryTextField.text = selectedCountry
        }else{
            selectedCategory = categories[row]
            categoryTextField.text = selectedCategory
        }
    }
}
