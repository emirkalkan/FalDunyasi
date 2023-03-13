//
//  DetailVC.swift
//  FalDunyasi
//
//  Created by Emir Kalkan on 11.03.2023.
//

import UIKit
import GoogleMobileAds

class DetailVC: UIViewController, GADFullScreenContentDelegate {
    var seconds = 120
    var minutes = 2
    var timer = Timer()
    
    private var admobRewardKey = "ca-app-pub-5544659989035359/6424476340" //-> real id
    //private var admobRewardKey = "ca-app-pub-3940256099942544/1712485313"
    private var rewardedAd: GADRewardedAd?
    private var appDidEnterBackgroundDate: Date?
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.tintColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
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
    
    private lazy var infoLabel : UILabel = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.text = "Bekleyen Niyetim & Bilgilerim Kahve Falı Bilgileriniz"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private lazy var nameValueLabel : UILabel = {
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
    
    private lazy var birthValueLabel : UILabel = {
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
    
    private lazy var genderValueLabel : UILabel = {
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
    
    private lazy var relationshipValueLabel : UILabel = {
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
    
    private lazy var timerLabel : UILabel = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.text = "Kalan Süre:"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timerValueLabel : UILabel = {
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
    
    private lazy var rewardView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1.00, green: 0.57, blue: 0.30, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rewardImageView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(red: 1.00, green: 0.57, blue: 0.30, alpha: 1.00)
        view.image = UIImage(named: "giftbox")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rewardLabel : UILabel = {
        let label = UILabel()
        label.text = "Hemen görmek için tıkla"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bannerView : GADBannerView = {
        let view = GADBannerView()
        view.backgroundColor = UIColor(red: 1.00, green: 0.57, blue: 0.30, alpha: 1.00)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    convenience init(name: String, date: String, gender: String, relationship: String) {
        self.init()
        self.nameValueLabel.text = name
        self.birthValueLabel.text = date
        self.genderValueLabel.text = gender
        self.relationshipValueLabel.text = relationship
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        setupView()
        setBanner()
        setupGesture()
        setRewardedAd()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setRewardedAd()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100)
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.74, blue: 0.35, alpha: 1.00)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        self.scrollView.addSubview(backButton)
        self.scrollView.addSubview(logoView)
        self.scrollView.addSubview(infoLabel)
        self.scrollView.addSubview(nameLabel)
        self.scrollView.addSubview(nameValueLabel)
        self.scrollView.addSubview(birthLabel)
        self.scrollView.addSubview(birthValueLabel)
        self.scrollView.addSubview(genderLabel)
        self.scrollView.addSubview(genderValueLabel)
        self.scrollView.addSubview(relationshipLabel)
        self.scrollView.addSubview(relationshipValueLabel)
        self.scrollView.addSubview(timerLabel)
        self.scrollView.addSubview(timerValueLabel)
        self.scrollView.addSubview(rewardView)
        self.scrollView.addSubview(bannerView)
        self.scrollView.addSubview(rewardImageView)
        self.scrollView.addSubview(rewardLabel)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            logoView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor),
            logoView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 150),
            logoView.heightAnchor.constraint(equalToConstant: 130),
            
            infoLabel.topAnchor.constraint(equalTo: self.logoView.bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            infoLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: self.infoLabel.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 160),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            nameValueLabel.centerYAnchor.constraint(equalTo: self.nameLabel.centerYAnchor),
            nameValueLabel.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor, constant: 20),
            nameValueLabel.widthAnchor.constraint(equalToConstant: 160),
            nameValueLabel.heightAnchor.constraint(equalToConstant: 40),
            
            birthLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            birthLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            birthLabel.widthAnchor.constraint(equalToConstant: 160),
            birthLabel.heightAnchor.constraint(equalToConstant: 40),
            
            birthValueLabel.centerYAnchor.constraint(equalTo: self.birthLabel.centerYAnchor),
            birthValueLabel.leadingAnchor.constraint(equalTo: self.birthLabel.trailingAnchor, constant: 20),
            birthValueLabel.widthAnchor.constraint(equalToConstant: 160),
            birthValueLabel.heightAnchor.constraint(equalToConstant: 40),
            
            genderLabel.topAnchor.constraint(equalTo: self.birthLabel.bottomAnchor, constant: 5),
            genderLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            genderLabel.widthAnchor.constraint(equalToConstant: 160),
            genderLabel.heightAnchor.constraint(equalToConstant: 40),
            
            genderValueLabel.centerYAnchor.constraint(equalTo: self.genderLabel.centerYAnchor),
            genderValueLabel.leadingAnchor.constraint(equalTo: self.birthLabel.trailingAnchor, constant: 20),
            genderValueLabel.widthAnchor.constraint(equalToConstant: 160),
            genderValueLabel.heightAnchor.constraint(equalToConstant: 40),
            
            relationshipLabel.topAnchor.constraint(equalTo: self.genderLabel.bottomAnchor, constant: 5),
            relationshipLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            relationshipLabel.widthAnchor.constraint(equalToConstant: 160),
            relationshipLabel.heightAnchor.constraint(equalToConstant: 40),
            
            relationshipValueLabel.centerYAnchor.constraint(equalTo: self.relationshipLabel.centerYAnchor),
            relationshipValueLabel.leadingAnchor.constraint(equalTo: self.relationshipLabel.trailingAnchor, constant: 20),
            relationshipValueLabel.widthAnchor.constraint(equalToConstant: 160),
            relationshipValueLabel.heightAnchor.constraint(equalToConstant: 40),
            
            timerLabel.topAnchor.constraint(equalTo: self.relationshipLabel.bottomAnchor, constant: 5),
            timerLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            timerLabel.widthAnchor.constraint(equalToConstant: 160),
            timerLabel.heightAnchor.constraint(equalToConstant: 40),
            
            timerValueLabel.centerYAnchor.constraint(equalTo: self.timerLabel.centerYAnchor),
            timerValueLabel.leadingAnchor.constraint(equalTo: self.timerLabel.trailingAnchor, constant: 20),
            timerValueLabel.widthAnchor.constraint(equalToConstant: 160),
            timerValueLabel.heightAnchor.constraint(equalToConstant: 40),
        
            rewardLabel.topAnchor.constraint(equalTo: self.timerLabel.bottomAnchor, constant: 20),
            rewardLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            rewardLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            rewardLabel.heightAnchor.constraint(equalToConstant: 40),
            
            rewardView.topAnchor.constraint(equalTo: self.rewardLabel.bottomAnchor),
            rewardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            rewardView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            rewardView.heightAnchor.constraint(equalToConstant: 100),
            
            rewardImageView.centerYAnchor.constraint(equalTo: self.rewardView.centerYAnchor),
            rewardImageView.centerXAnchor.constraint(equalTo: self.rewardView.centerXAnchor),
            rewardImageView.widthAnchor.constraint(equalToConstant: 100),
            rewardImageView.heightAnchor.constraint(equalToConstant: 100),
            
            bannerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bannerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            bannerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            bannerView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func runTimer() {
        dispatchNotification()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DetailVC.updateTimer), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    private func setBanner() {
        //real id -> ca-app-pub-5544659989035359/8152313377
        //test id -> ca-app-pub-3940256099942544/2934735716
        bannerView.adUnitID = "ca-app-pub-5544659989035359/8152313377"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(adTapped))
        let tapView = UITapGestureRecognizer(target: self, action: #selector(adTapped))
        let tapLabel = UITapGestureRecognizer(target: self, action: #selector(adTapped))
        rewardLabel.isUserInteractionEnabled = true
        rewardLabel.addGestureRecognizer(tapLabel)
        
        rewardView.isUserInteractionEnabled = true
        rewardView.addGestureRecognizer(tapView)
        
        rewardImageView.isUserInteractionEnabled = true
        rewardImageView.addGestureRecognizer(tap)
    }
    
    //MARK: Actions
    @objc func backButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func updateTimer() {
        seconds -= 1
        let timeLabel = timeString(time: TimeInterval(seconds))
        DispatchQueue.main.async {
            self.timerValueLabel.text = timeLabel
        }
        if seconds == 0 {
            //pass to fortune vc
            UserDefaults.standard.set(true, forKey: "notification")
            UserDefaults.standard.set(nameValueLabel.text, forKey: "name")
            let vc = FortuneVC()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
        }
    }
    
    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    @objc func applicationDidEnterBackground(_ notification: NotificationCenter) {
        appDidEnterBackgroundDate = Date()
        
    }

    @objc func applicationWillEnterForeground(_ notification: NotificationCenter) {
        guard let previousDate = appDidEnterBackgroundDate else { return }
        let calendar = Calendar.current
        let difference = calendar.dateComponents([.second], from: previousDate, to: Date())
        let seconds = difference.second!
        self.seconds -= seconds
    }
    
    //MARK: Google Reward Ad
    private func setRewardedAd() {
        GADRewardedAd.load(withAdUnitID: admobRewardKey, request: GADRequest()) { ad, error in
            if let error = error {
                return print("Failed to load rewarded interstitial ad wit error: \(error.localizedDescription)")
            }
            
            self.rewardedAd = ad
            print("Rewarded ad loaded.")
            self.rewardedAd?.fullScreenContentDelegate = self
        }
    }
    
    func showRewardedAd() {
        if let ad = rewardedAd {
            let vc = FortuneVC(name: nameValueLabel.text!)
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            ad.present(fromRootViewController: vc, userDidEarnRewardHandler: {
                let reward = ad.adReward
                print("\(reward.amount) \(reward.type)")
            })
            //self.present(vc, animated: true)
        } else {
            print("Rewarded ad wasn't ready.")
        }
    }
    
    @objc private func adTapped() {
        print("click adTap")
        showRewardedAd()
    }
}

extension DetailVC {
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
        let title = "Kahve Falı Dünyası"
        let body = "Kahve Falın Hazır. Okumak için tıkla."
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        let date = Date()
        dateComponents.hour = calendar.component(.hour, from: date)
        dateComponents.minute = calendar.component(.minute, from: date) + minutes
        dateComponents.second = calendar.component(.second, from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }
}


