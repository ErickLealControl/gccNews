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
    
    @IBOutlet weak var newsTableView: UITableView!
    var listOfNews = [Articles](){
        didSet{
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
    }
    
    let countries = ["MX",
                     "DE",
                     "ES",
                     "US"]
    
    let categories = ["bussines",
                      "entertainment",
                      "health",
                      "science",
                      "sports",
                      "technology"]
    
    var selectedCountry: String?
    var selectedCategory: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GCC News"
        createCountryPicker()
        createToolbar()
        getListOfNews()
        self.newsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        initTableView()
        
    }
    func getListOfNews(){
        guard let country = conutryTextField.text else {return}
        guard let category = categoryTextField.text else {return}
        
        let newrequest = NewsRequest(country: country, category: category)
        newrequest.getNews{[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let news):
                self?.listOfNews = news
            }
        }
    }
    func initTableView(){
        self.newsTableView.delegate = self
        self.newsTableView.dataSource = self
        
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
        getListOfNews()
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
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell =  newsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell{
            
            let new = listOfNews[indexPath.row]
            cell.lblTitle.text = new.title
            cell.lblBody.text = new.description
            cell.url = new.url ?? ""
            return cell
        }
        return UITableViewCell()
    }
    
    
}
