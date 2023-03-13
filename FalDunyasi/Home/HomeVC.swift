//
//  HomeVC.swift
//  FalDunyasi
//
//  Created by Emir Kalkan on 10.03.2023.
//

import UIKit
import GoogleMobileAds
import UserNotifications

class HomeVC: UIViewController, GADFullScreenContentDelegate {
    var genderList = ["Erkek", "Kadın", "LGBT"]
    var relationshipList = ["İlişkisi yok", "İlişkisi var", "Karmaşık", "Evli", "Nişanlı"]
    
    var seconds = 150
    var timer = Timer()
    var isTimerRunning = false
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(red: 1.00, green: 0.74, blue: 0.35, alpha: 1.00)
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var logoView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "icon.pdf")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var adDiscountView : UIView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(red: 1.00, green: 0.57, blue: 0.30, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var adView : UIView = {
        let view = UIImageView()
        view.image = UIImage(named: "Efsane")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var adLabel : UILabel = {
        let label = UILabel()
        //label.text = "Bu teklif sadece 04:11 dakika geçerlidir."
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bannerView : GADBannerView = {
        let view = GADBannerView()
        view.backgroundColor = UIColor(red: 1.00, green: 0.57, blue: 0.30, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.text = "Adınız:"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextfield : UITextField = {
        let textField = UITextField()
        textField.tintColor = .white
        textField.autocorrectionType = .no
        textField.placeholder = "Ad"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var birthLabel : UILabel = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.text = "Doğum Tarihiniz:"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var birthTextfield : UITextField = {
        let textField = UITextField()
        //textField.backgroundColor = .red
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.autocorrectionType = .no
        textField.placeholder = "Doğum Tarihi"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var genderLabel : UILabel = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.text = "Cinsiyetiniz:"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genderTextfield : UITextField = {
        let textField = UITextField()
        //textField.backgroundColor = .red
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.autocorrectionType = .no
        textField.placeholder = "Cinsiyet"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var relationshipLabel : UILabel = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.text = "İlişki Durumunuz:"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var relationshipTextfield : UITextField = {
        let textField = UITextField()
        //textField.backgroundColor = .red
        textField.autocapitalizationType = UITextAutocapitalizationType.none
        textField.autocorrectionType = .no
        textField.placeholder = "İlişki Durumu"
        textField.borderStyle = .roundedRect
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    /*private lazy var checkboxLabel : CheckBox = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.text = "Bilgilerimi Kaydet"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkboxView : UIView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()*/
    
    private lazy var sendButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(gray: 1, alpha: 1)
        button.setTitle("Fal Baktır", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var birthDatePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
            picker.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        } else {
            // Fallback on earlier versions
        }
        picker.isHidden = true
        picker.addTarget(self, action: #selector(datechanged), for: UIControl.Event.valueChanged)
        return picker
    }()
    
    private lazy var genderPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        picker.delegate = self
        picker.isHidden = true
        return picker
    }()
    
    private lazy var relationshipPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        picker.delegate = self
        picker.isHidden = true
        return picker
    }()
    
    private lazy var adDismissButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.red), for: .normal)
        button.addTarget(self, action: #selector(adDismissTapped), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !UserDefaults.standard.bool(forKey: "adsRemoved") {
            //show ads
        } else {
            bannerView.isHidden = true
            adDiscountView.isHidden = true
            adView.isHidden = true
            adLabel.isHidden = true
        }
        setupView()
        runTimer()
        setupGesture()
        setBanner()
        checkPermission()
        AppInPurchaseHelper.shared.getProductsFromServer()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100)
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.74, blue: 0.35, alpha: 1.00)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        self.scrollView.addSubview(logoView)
        self.scrollView.addSubview(adDiscountView)
        self.scrollView.addSubview(nameLabel)
        self.scrollView.addSubview(nameTextfield)
        self.scrollView.addSubview(birthLabel)
        self.scrollView.addSubview(birthTextfield)
        self.scrollView.addSubview(genderLabel)
        self.scrollView.addSubview(genderTextfield)
        self.scrollView.addSubview(relationshipLabel)
        self.scrollView.addSubview(relationshipTextfield)
        //self.scrollView.addSubview(checkboxLabel)
        //self.scrollView.addSubview(checkboxView)
        self.scrollView.addSubview(sendButton)
        self.scrollView.addSubview(bannerView)
        self.scrollView.addSubview(adDismissButton)
        
        self.scrollView.addSubview(adView)
        self.scrollView.addSubview(adLabel)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            logoView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 150),
            logoView.heightAnchor.constraint(equalToConstant: 130),
            
            adDiscountView.topAnchor.constraint(equalTo: self.logoView.bottomAnchor),
            adDiscountView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            adDiscountView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            adDiscountView.heightAnchor.constraint(equalToConstant: 70),
            
            adView.centerYAnchor.constraint(equalTo: self.adDiscountView.centerYAnchor),
            adView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            adView.heightAnchor.constraint(equalToConstant: 70),
            adView.widthAnchor.constraint(equalToConstant: 100),
            
            adLabel.centerYAnchor.constraint(equalTo: self.adDiscountView.centerYAnchor),
            adLabel.leadingAnchor.constraint(equalTo: self.adView.trailingAnchor, constant: 30),
            adLabel.heightAnchor.constraint(equalToConstant: 80),
            adLabel.widthAnchor.constraint(equalToConstant: 250),
            
            nameLabel.topAnchor.constraint(equalTo: self.adDiscountView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 160),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            
            nameTextfield.centerYAnchor.constraint(equalTo: self.nameLabel.centerYAnchor),
            nameTextfield.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 20),
            nameTextfield.widthAnchor.constraint(equalToConstant: 160),
            nameTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            birthLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20),
            birthLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            birthLabel.widthAnchor.constraint(equalToConstant: 160),
            birthLabel.heightAnchor.constraint(equalToConstant: 60),
            
            birthTextfield.centerYAnchor.constraint(equalTo: self.birthLabel.centerYAnchor),
            birthTextfield.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 20),
            birthTextfield.widthAnchor.constraint(equalToConstant: 160),
            birthTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            genderLabel.topAnchor.constraint(equalTo: self.birthLabel.bottomAnchor, constant: 20),
            genderLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            genderLabel.widthAnchor.constraint(equalToConstant: 160),
            genderLabel.heightAnchor.constraint(equalToConstant: 60),
            
            genderTextfield.centerYAnchor.constraint(equalTo: self.genderLabel.centerYAnchor),
            genderTextfield.leadingAnchor.constraint(equalTo: self.birthLabel.trailingAnchor, constant: 20),
            genderTextfield.widthAnchor.constraint(equalToConstant: 160),
            genderTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            relationshipLabel.topAnchor.constraint(equalTo: self.genderLabel.bottomAnchor, constant: 20),
            relationshipLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            relationshipLabel.widthAnchor.constraint(equalToConstant: 160),
            relationshipLabel.heightAnchor.constraint(equalToConstant: 60),
            
            relationshipTextfield.centerYAnchor.constraint(equalTo: self.relationshipLabel.centerYAnchor),
            relationshipTextfield.leadingAnchor.constraint(equalTo: self.relationshipLabel.trailingAnchor, constant: 20),
            relationshipTextfield.widthAnchor.constraint(equalToConstant: 160),
            relationshipTextfield.heightAnchor.constraint(equalToConstant: 40),
            
            /*checkboxLabel.topAnchor.constraint(equalTo: self.relationshipLabel.bottomAnchor, constant: 20),
            checkboxLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            checkboxLabel.widthAnchor.constraint(equalToConstant: 160),
            checkboxLabel.heightAnchor.constraint(equalToConstant: 60),
            
            checkboxView.topAnchor.constraint(equalTo: self.relationshipLabel.bottomAnchor, constant: 20),
            checkboxView.leadingAnchor.constraint(equalTo: self.checkboxLabel.trailingAnchor, constant: 20),
            checkboxView.widthAnchor.constraint(equalToConstant: 160),
            checkboxView.heightAnchor.constraint(equalToConstant: 60),*/
            
            sendButton.topAnchor.constraint(equalTo: self.relationshipLabel.bottomAnchor, constant: 40),
            sendButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            sendButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            
            adDismissButton.bottomAnchor.constraint(equalTo: self.bannerView.topAnchor, constant: 20),
            adDismissButton.trailingAnchor.constraint(equalTo: self.bannerView.trailingAnchor),
            adDismissButton.heightAnchor.constraint(equalToConstant: 50),
            adDismissButton.widthAnchor.constraint(equalToConstant: 50),
            
            bannerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bannerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            bannerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            bannerView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc private func sendButtonTapped() {
        print("send")
        if nameTextfield.text != "", birthTextfield.text != "", genderTextfield.text != "", relationshipTextfield.text != "" {
            let vc = DetailVC(name: nameTextfield.text ?? "", date: birthTextfield.text ?? "", gender: genderTextfield.text ?? "", relationship: relationshipTextfield.text ?? "")
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Hata", message: "Lütfen eksik alanları doldurunuz.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc private func datechanged() {
        self.birthDatePickerView.isHidden = true
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        
        self.birthTextfield.text = formatter.string(from: birthDatePickerView.date)
        view.endEditing(true)
    }
    
    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(HomeVC.updateTimer), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc private func updateTimer() {
        seconds -= 1
        var timeLabel = timeString(time: TimeInterval(seconds))
        DispatchQueue.main.async {
            self.adLabel.text = "*Reklamları Kaldır* Teklif sadece \(timeLabel) geçerlidir."
        }
        if seconds == 0 {
            self.adLabel.isHidden = true
            self.adView.isHidden = true
            self.adView.isUserInteractionEnabled = false
            self.adLabel.isUserInteractionEnabled = false
        }
    }
    
    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(adTapped))
        let tapView = UITapGestureRecognizer(target: self, action: #selector(adTapped))
        let tapLabel = UITapGestureRecognizer(target: self, action: #selector(adTapped))
        adLabel.isUserInteractionEnabled = true
        adLabel.addGestureRecognizer(tapLabel)
        
        adView.isUserInteractionEnabled = true
        adView.addGestureRecognizer(tapView)
        
        adDiscountView.isUserInteractionEnabled = true
        adDiscountView.addGestureRecognizer(tap)
    }
    
    private func setBanner() {
        //real id -> ca-app-pub-5544659989035359/8152313377
        //test id -> ca-app-pub-3940256099942544/2934735716
        bannerView.adUnitID = "ca-app-pub-5544659989035359/8152313377"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }
    
    @objc private func adDismissTapped() {
        print("adDismiss")
    }
    
    @objc private func adTapped() {
        print("click adTap")
        AppInPurchaseHelper.shared.buyProduct(prodId: .removeAd)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

extension HomeVC: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView == birthDatePickerView {
            return 1
        }
        
        if pickerView == genderPickerView {
            return genderList.count
        }
        
        if pickerView == relationshipPickerView {
            return relationshipList.count
        }
        return 0
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        view.endEditing(true)
        if pickerView == birthDatePickerView {
            return genderList[row]
        }
        
        if pickerView == genderPickerView {
            return genderList[row]
        }
        
        if pickerView == relationshipPickerView {
            return relationshipList[row]
        }
        return genderList[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == genderPickerView {
            self.genderPickerView.isHidden = true
            self.genderTextfield.text = genderList[row]
        }
        
        if pickerView == relationshipPickerView {
            self.relationshipPickerView.isHidden = true
            self.relationshipTextfield.text = relationshipList[row]
        }
    }
    
    private func showDatePicker() {
        dismissKeyboard()
        self.scrollView.addSubview(birthDatePickerView)
        birthDatePickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        birthDatePickerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        birthDatePickerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        birthDatePickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.birthDatePickerView.isHidden = false
    }
    
    private func showGenderPicker() {
        dismissKeyboard()
        self.scrollView.addSubview(genderPickerView)
        genderPickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        genderPickerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        genderPickerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        genderPickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.genderPickerView.isHidden = false
    }
    
    private func showRelationPicker() {
        dismissKeyboard()
        self.scrollView.addSubview(relationshipPickerView)
        relationshipPickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        relationshipPickerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        relationshipPickerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        relationshipPickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.relationshipPickerView.isHidden = false
    }
}

extension HomeVC: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == birthTextfield {
            dismissKeyboard()
            self.showDatePicker()
        }
        
        if textField == genderTextfield {
            dismissKeyboard()
            self.showGenderPicker()
        }
        
        if textField == relationshipTextfield {
            dismissKeyboard()
            self.showRelationPicker()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextfield {
            dismissKeyboard()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false
    }
}

extension HomeVC {
    func checkPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.dispatchNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
    }
    
    func dispatchNotification() {
        let identifier = "evening-notification"
        let title = "Kahve Falı Dünyası!"
        let body = "Niyetlenip kahve falı baktırma zamanı gelmedi mi sanki :)"
        let hour = 11
        let hour2 = 20
        let minute = 15
        let isDaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let dateComponents2 = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour2
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents2, repeats: isDaily)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        let request2 = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger2)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
        notificationCenter.add(request2)
    }
}

