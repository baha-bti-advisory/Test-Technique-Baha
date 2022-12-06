//
//  DetailsViewController.swift
//  Test Technique Baha
//
//  Created by Bahaeddine Boulaabi on 06/12/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: -- Outlets and variables of the ViewController
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var jetBraindetail = JetBrainModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: -- Display data
        fullNameLbl.text = jetBraindetail.fullName
        descriptionLbl.text = jetBraindetail.description
    }

    // MARK: -- Button to dismiss the view controller
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
