//
//  CustomTableViewCell.swift
//  gccNews
//
//  Created by Erick Emmanuel Tamez Leal on 02/09/20.
//  Copyright © 2020 Erick Emmanuel Tamez Leal. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var readmoreButton: UIButton!
    var url:String = ""
    @IBAction func readmoreButtonClick(_ sender: Any) {
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
