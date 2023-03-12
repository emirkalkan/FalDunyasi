//
//  Checkbox.swift
//  FalDunyasi
//
//  Created by Emir Kalkan on 11.03.2023.
//

import Foundation
import UIKit

class CheckBox: UIView {
    
    private var actionLink: () -> Void
    private var action: () -> Void
    public let buttonCheck: UIButton
    public let labelText: UILabel
    
    init(text: String, underline: String, action: @escaping () -> Void, actionLink: @escaping () -> Void) {
        self.action = action
        self.actionLink = actionLink
        
        buttonCheck = UIButton(type: .custom)
        buttonCheck.setImage(UIImage(named: "unchecked.png"), for: .normal)
        buttonCheck.setImage(UIImage(named: "checked.png")?.withRenderingMode(.alwaysTemplate), for: .selected)
        buttonCheck.tintColor = .black
        
        self.labelText = UILabel()
        self.labelText.textAlignment = .left
        self.labelText.numberOfLines = 0
        self.labelText.font = UIFont.systemFont(ofSize: 12.0)
        self.labelText.textColor = .black
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: text)
        attributeString.setColorForText(textForAttribute: underline, withColor: .black)
        let textRange = NSRange(location: 0, length: underline.count)
        attributeString.addAttribute(.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: textRange)
        self.labelText.attributedText = attributeString
        
        super.init(frame: .zero)
        
        self.buttonCheck.addTarget(self, action: #selector(execute(_:)), for: .touchUpInside)
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(executeLink(_:)))
        tap.numberOfTapsRequired = 1
        self.labelText.isUserInteractionEnabled = true
        self.labelText.addGestureRecognizer(tap)
        
        initViews()
        setupLayouts()
    }
    
    private func initViews() {
        backgroundColor = .clear
        addSubview(buttonCheck)
        addSubview(labelText)
    }
    
    private func setupLayouts() {
        buttonCheck.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonCheck.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            buttonCheck.heightAnchor.constraint(equalToConstant: 24),
            buttonCheck.widthAnchor.constraint(equalToConstant: 24),
            buttonCheck.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        labelText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelText.leadingAnchor.constraint(equalTo: self.buttonCheck.trailingAnchor, constant: 12),
            labelText.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            labelText.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    @objc private func execute(_ sender : UIButton) {
        buttonCheck.isSelected = !(buttonCheck.isSelected)
        action()
    }
    
    @objc private func executeLink(_ sender : UITapGestureRecognizer) {
        actionLink()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
}

extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)

        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 12.0, weight: UIFont.Weight(rawValue: 0.5)), range: range)
    }

}
