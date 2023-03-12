//
//  DetailVC.swift
//  FalDunyasi
//
//  Created by Emir Kalkan on 11.03.2023.
//

import UIKit

class DetailVC: UIViewController {
    //timer ekle
    //reklam ekle
    
    convenience init(name: String, date: String, gender: String, relationship: String) {
        self.init()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        
    }
}
