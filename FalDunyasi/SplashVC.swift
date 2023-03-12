//
//  SplashVC.swift
//  FalDunyasi
//
//  Created by Emir Kalkan on 10.03.2023.
//

import UIKit

class SplashVC: UIViewController {
    
    private lazy var logoView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            let vc = HomeVC()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            self.present(vc, animated: true)
        }
    }

    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(logoView)
        
        logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        logoView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
}

