//
//  FortuneVC.swift
//  FalDunyasi
//
//  Created by Emir Kalkan on 11.03.2023.
//

import UIKit

class FortuneVC: UIViewController {
    
    var fortuneList = [
        "Yakın gelecekte büyük sevinç getirecek beklenmedik bir haber alacaksın. Bu iş yerinde bir terfi, sevdiğinden beklenmedik bir hediye veya üzerinde çalıştığın bir projenin olumlu sonucu olabilir. Koyu ve gizemli bir figür yakın zamanda hayatına girebilir. Bu kişi ilk başta ürkütücü görünebilir, ancak zamanla, değerli bir müttefik olduğunu göreceksin ve senin yolculuğunda sana yardımcı olacak. Yakın gelecekte bir yolculuk seni bekliyor, ya gerçek anlamda bir yere seyahat edeceksin ya da kişisel bir büyüme ve kendini keşfetme yolculuğuna çıkacaksın. Yakında bir değişiklik olacak ve bu değişiklik senin bırakman gereken bir şeyi veya birini içerebilir. İlk başta zor olabilir, ancak sonunda yeni fırsatlar ve büyüme ile sonuçlanacaktır. Sen uzun bir süredir çalışıyorsun ve yakında emeğinin meyvelerini toplayacaksın. Başarı ve tanınma yakında seni bekliyor, ve çabaların büyük bir şekilde ödüllendirilecek.",
        "İşaretler, yakın zamanda yaşamında yeni biriyle tanışacağını gösteriyor. Bu kişi senin hayatına önemli bir etki yapacak ve seninle paylaşacak birçok şeyi olacak. Falındaki semboller, yakında bir karar vermen gerektiğini gösteriyor. Bu karar hayatında önemli bir dönüm noktası olabilir, bu nedenle dikkatli düşünmen ve hislerine güvenmen önemlidir. İlerleyen günlerde, kendine daha fazla zaman ayırman gerekebilir. Bu, hayatındaki stresi azaltmak, daha fazla hobi edinmek veya kendini daha iyi tanımak için fırsatlar yaratmak anlamına gelebilir. Kahve fincanındaki çizgiler, senin sevdiklerinle aranda bir anlaşmazlık yaşayabileceğini gösteriyor. Bu durumda, sabırlı olmak ve herkesin duygularını anlamak için çaba sarf etmek önemlidir. Yakın zamanda bir fırsat kapını çalacak ve bu fırsatı değerlendirmek senin elinde olacak. Kendine güven ve cesaret göstermen gerekebilir, ancak sonunda bu fırsat seni daha iyi bir yere götürebilir.",
        "Kahve fincanındaki semboller, hayatında bazı zorluklarla karşılaşabileceğini gösteriyor. Ancak, bu zorlukların seni güçlendireceğini ve yeni bir bakış açısı kazanmanı sağlayacağını unutma. Falındaki şekiller, yakın zamanda senin hayatında olacak biri hakkında önemli ipuçları veriyor. Bu kişi senin hayatına pozitif bir etki yapacak ve senin için önemli biri olabilir. İşaretler, yakın zamanda senin için önemli bir kararın kapıda olduğunu gösteriyor. Bu karar senin hayatını kökten değiştirebilir, bu nedenle dikkatli düşünmen gerekiyor. Kahve fincanındaki şekiller, senin için yeni bir başlangıcın mümkün olduğunu gösteriyor. Bu, yeni bir iş, bir ilişki veya başka bir konuda olabilir. Fırsatları değerlendirirken kendine güven ve cesaret göster. Yakın zamanda, hayatındaki bir kişi seni hayal kırıklığına uğratabilir. Bu durumda, duygularını açıkça ifade etmek ve sağduyulu bir şekilde iletişim kurmak önemlidir.",
        "Kahve fincanındaki şekiller, hayatında önemli bir değişimin olabileceğini gösteriyor. Bu değişim, kariyerinde, aşk hayatında veya kişisel hayatında olabilir. Hazır ol ve fırsatları değerlendir. İşaretler, yakın zamanda senin için yeni bir başlangıcın mümkün olduğunu gösteriyor. Bu yeni başlangıç, yeni bir iş, bir ilişki veya bir hobinin keşfi olabilir. Falındaki semboller, senin hayatında biri hakkında endişeli olduğunu gösteriyor. Bu endişelerin nedenini belirlemeye çalış ve iletişim kurarak sorunu çözmeye çalış. Kahve fincanındaki şekiller, senin için zor bir dönemin olabileceğini gösteriyor. Ancak, bu dönemde senin yanında olan insanlara güvenebilirsin ve bu zorluğun seni daha güçlü hale getireceğini unutma. İlerleyen günlerde, kendine daha fazla zaman ayırman gerekebilir. Bu, kendini daha iyi tanımak, hobilerine zaman ayırmak veya stresi azaltmak için fırsatlar yaratmak anlamına gelebilir.",
        "Kahve fincanındaki şekiller, yakın zamanda hayatında bir değişimin olacağını gösteriyor. Bu değişim, kariyerinde, aşk hayatında veya kişisel hayatında olabilir. Bu değişim seni ilk başta rahatsız edebilir, ancak sonunda senin için iyi olacak. Falındaki semboller, senin hayatındaki bazı kişiler hakkında endişe ettiğini gösteriyor. Bu endişelerinin nedenlerini anlamaya çalış ve iletişim kurarak sorunları çözmeye çalış. İşaretler, senin hayatındaki önemli bir karar hakkında düşünmen gerektiğini gösteriyor. Bu karar, kariyer, aşk hayatı veya kişisel yaşamınla ilgili olabilir. Bu karar senin hayatını değiştirebilir, bu nedenle dikkatli düşünmen gerekiyor. Kahve fincanındaki şekiller, senin için yeni bir başlangıcın mümkün olduğunu gösteriyor. Bu, yeni bir iş, bir ilişki veya başka bir konuda olabilir. Fırsatları değerlendirirken kendine güven ve cesaret göster. İlerleyen günlerde, kendine daha fazla zaman ayırman gerekebilir. Bu, kendini daha iyi tanımak, hobilerine zaman ayırmak veya stresi azaltmak için fırsatlar yaratmak anlamına gelebilir. Bu, senin hayat kaliteni arttırabilir ve mutlu bir yaşam sürmeni sağlayabilir. Kahve fincanındaki semboller, senin için bir şeyleri affetmen gerektiğini gösteriyor. Bu, kendini ya da başkalarını affetmek olabilir. Bu affetme süreci seni özgürleştirebilir ve daha pozitif bir ruh haline sahip olmanı sağlayabilir.",
        "Kahve fincanındaki şekiller, yakın zamanda hayatında bir dönüm noktası olacağını gösteriyor. Bu dönüm noktası senin için önemli bir karar almanı gerektirebilir. Bu karar senin hayatını değiştirebilir, bu nedenle dikkatli düşünmen gerekiyor. Falındaki semboller, aşk hayatınla ilgili bir konuda endişelerin olduğunu gösteriyor. Bu endişelerinin nedenlerini belirlemeye çalış ve iletişim kurarak sorunları çözmeye çalış. İşaretler, senin için bir seyahat veya yeni bir yer keşfetmen gerektiğini gösteriyor. Bu yeni deneyim seni enerjik ve yenilenmiş hissettirebilir. Kahve fincanındaki semboller, senin hayatındaki bazı insanlar hakkında endişelerin olduğunu gösteriyor. Bu endişelerinin nedenlerini belirlemeye çalış ve iletişim kurarak sorunları çözmeye çalış. Bu, senin için daha sağlıklı ve mutlu bir ilişki yaratmanı sağlayabilir. İlerleyen günlerde, kendine daha fazla zaman ayırman gerekebilir. Bu, kendini daha iyi tanımak, hobilerine zaman ayırmak veya stresi azaltmak için fırsatlar yaratmak anlamına gelebilir. Bu senin hayat kaliteni arttırabilir ve mutlu bir yaşam sürmeni sağlayabilir. Kahve fincanındaki şekiller, senin için yeni bir başlangıcın mümkün olduğunu gösteriyor. Bu, yeni bir iş, bir ilişki veya başka bir konuda olabilir. Fırsatları değerlendirirken kendine güven ve cesaret göster.",
        "Kahve fincanındaki semboller, bir hayalini gerçekleştirmek için ilerlemeni sağlayacak fırsatların olduğunu gösteriyor. Bu fırsatları yakalamak için cesur ol ve risk al. Hayatının yönünü değiştirebilecek harika bir deneyim yaşayabilirsin. Kahve fincanındaki şekiller, yakın zamanda bazı olumsuz duygular yaşayabileceğini gösteriyor. Bu duyguları tanı ve onları ele almak için adımlar at. Kendine iyilik yapmak için yapabileceğin küçük şeyler yaparak, mutluluğu yeniden keşfedebilirsin. Senin hayatındaki bir insanın seni sevdiği ama bunu açıkça ifade edemediği gözüküyor. Belki de bu kişi bir arkadaşın veya bir akraban olabilir. Onun duygularına karşılık vermen mümkün olmayabilir, ancak senin açık ve samimi olman, sizin aranızdaki ilişkiyi güçlendirebilir. Kahve fincanındaki semboller, senin yakın zamanda bir sınavla karşılaşacağını gösteriyor. Bu sınav, bir iş mülakatı, bir proje teslimi veya sınav olabilir. Kendine güven, hazırlık yap ve en iyisini ver. Başarılı olmak için cesaretin ve çalışkanlığın yeterli olacak. Kahve fincanındaki şekiller, senin aşk hayatının yakında hareketleneceğini gösteriyor. Bu hareketlenme yeni bir ilişki, beklenmedik bir karşılaşma veya var olan ilişkideki güçlü bağların daha da güçlenmesi anlamına gelebilir. Hayatının aşkını bulma yolunda bir adım daha atabilirsin.",
        "Kahve fincanında beliren şekiller, bir tilki gibi zeki ve kurnaz bir kişiliğe sahip olduğunu gösteriyor. Bu özelliklerin sana, önemli bir karar vermen gerektiğinde yardımcı olabilir. Senin içgüdülerine güven ve risk almakta çekinme. Kahve fincanındaki semboller, bir at gibi hızlı ve enerjik bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki projeler veya hedefler hızlı bir şekilde ilerleyebilir, ancak bu hızlı ilerleme, bazen seni yorabilir. Zaman zaman dinlenmek ve şarj olmak için zaman ayırmayı unutma. Kahve fincanındaki şekiller, bir örümceğin ağ gibi ustaca ve stratejik bir yaklaşımını yansıtıyor. Senin hayatındaki zorlu durumları çözmek için mantıklı ve yaratıcı bir yaklaşım benimsemen gerekebilir. Daha önce görmediğin bir çözüm yoluyla sorunları çözmek için cesur ol. Kahve fincanındaki semboller, bir filin gibi sağlam ve güçlü bir kişiliğe sahip olduğunu gösteriyor. Bu özellikler, hayatındaki zorluklarla başa çıkmak için ihtiyacın olan gücü ve dayanıklılığı sağlayabilir. Kendine güven ve hayatındaki hedeflere ulaşmak için kararlı ol. Kahve fincanındaki şekiller, bir tavşanın gibi hızlı ve atik bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki olaylar hızlı bir şekilde gelişebilir ve sen de bu hızlı tempoya ayak uydurmak zorunda kalabilirsin. Daha önce yapmadığın şeyleri denemek ve kendini farklı deneyimlere açmak için cesaretli ol.",
        "Kahve fincanındaki semboller, bir kuşun kanatları gibi özgür ve maceraperest bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki rutinlerden sıkılabilir ve yeni deneyimler arayışına girebilirsin. Ancak, hayatındaki belirsizlikleri ve riskleri göz önünde bulundurarak, sağduyulu bir yaklaşım benimsemen önemlidir. Senin cesaretin ve maceracı ruhun, hayatında ilerlemen için seni cesaretlendirebilir.Kahve fincanındaki semboller, bir aslanın pençeleri gibi güçlü ve kararlı bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki hedeflere ulaşmak için ihtiyacın olan kararlılık ve güç, senin içinde var olan potansiyelleri ortaya çıkarmana yardımcı olabilir. Ancak, bu güçlü özelliklerini yönetebilmek ve kontrollü bir şekilde kullanabilmek önemlidir. Senin hayatındaki başarılarla birlikte, bazı zorluklar da karşılaşabilirsin. Bu zorlukları aşmak için cesur ve kararlı olman gerekiyor. Kahve fincanındaki semboller, bir yılanın hareketleri gibi esnek ve adapte olabilen bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki durumlar, zaman zaman beklenmedik şekillerde gelişebilir ve bu seni zor durumda bırakabilir. Ancak senin esnekliğin ve uyum sağlama yeteneğin, seni zorlukların üstesinden gelmeye yardımcı olabilir. Senin hayatında, değişime ve yeniliklere açık olman ve farklı yaklaşımlar denemen gerekiyor. Kahve fincanındaki semboller, bir kurtun gibi zeki ve sezgisel bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki sorunları çözmek için akıllıca bir yaklaşım benimsemen gerekiyor. Bu yaklaşım, sadece zihinsel kapasitelerine değil, aynı zamanda içgüdülerine de dayanıyor. Senin içgüdülerine güvenmen ve bilgeliğinle hareket etmen, hayatındaki durumların üstesinden gelmene yardımcı olabilir. Kahve fincanındaki semboller, bir filin hafızası gibi hatırlayıcı ve duyarlı bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki insanlarla ve olaylarla olan etkileşimlerinde, başka insanların hislerine ve ihtiyaçlarına saygı göstermen ve onları anlaman önemlidir. Senin hatırlama yeteneğin, bu bilgileri senin hayatında ilerleme sağlamak için kullanmana yardımcı olabilir.",
        "Kahve fincanındaki semboller, bir atın özgür ruhu gibi bağımsız ve özgür bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki bağımsızlığın, seni kendi yolunu çizmeye teşvik ediyor. Ancak, bu özgürlük aynı zamanda sorumlulukları da beraberinde getiriyor. Senin hayatında, kendi kararlarını kendin vermekten korkmaman ve hayatındaki riskleri göze almaktan çekinmemen gerekiyor. Senin bağımsızlığın ve özgürlük ruhunun, seni hayatta ilerlemeye yönlendirebilir. Kahve fincanındaki semboller, bir tilkinin hızlı hareketleri gibi akıllı ve çevik bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki durumları ve olayları analiz etmek için keskin bir zekaya sahipsin. Ancak, bu zekanı kullanırken dikkatli olman gerekiyor. Senin hayatındaki insanlarla ilişkilerinde, dürüstlük ve saygı gibi değerleri koruman ve insanların ihtiyaçlarını anlamak önemlidir. Senin zekan ve sezgilerin, hayatındaki kararların doğru olmasına yardımcı olabilir. Kahve fincanındaki semboller, bir arının çalışkanlığı gibi özenli ve çalışkan bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki işlerde başarı için çaba göstermen, çalışkanlığın ve özenli davranışlarınla dikkat çekiyor. Ancak, senin hayatındaki insanlarla ilişkilerinde, bazen işlerin hızına ve sonucuna o kadar odaklanırsın ki, insanların hislerini ve ihtiyaçlarını göz ardı edersin. Senin çalışkanlığın ve özenin, hayatındaki başarılarına katkıda bulunabilir, ancak diğer insanların duygularını da önemsemelisin. Kahve fincanındaki semboller, bir penguenin sadakati gibi sadık ve adanmış bir kişiliğe sahip olduğunu gösteriyor. Senin hayatındaki ilişkilerde, sadakat ve adanmışlığınla öne çıkıyorsun. Ancak, senin bu özelliklerin sana bazen zarar verebilir. Başkalarına duygusal bağlılığın, seni körleştirebilir ve doğru olanı görmeni engelleyebilir. Senin sadakatin ve adanmışlığın, hayatındaki ilişkilerin güçlenmesine ve ilerlemesine yardımcı olabilir, ancak kendi sınırlarını ve ihtiyaçlarını da unutmamalısın.",
        /*"",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         "",
         ""*/]
    
    var endText = ["Hatırla, kahve falı yorumları sadece eğlence amaçlıdır ve ciddiye alınmamalıdır. Gerçek güç, senin içinde ve hayatında olumlu değişiklikler yapma yeteneğinde yatar.", "Unutma, kahve falı yorumları eğlencelik amaçlıdır ve senin hayatının gerçeklerine dayanmaz. Ancak, bazen farklı bir perspektif kazanmanıza ve düşüncelerinizi yeniden değerlendirmenize yardımcı olabilir."]
    
    var name = ""
    
    private lazy var logoView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "icon.pdf")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var infoLabel : UILabel = {
        let label = UILabel()
        //label.backgroundColor = .green
        label.text = "Kahve Falı Yorumun"
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fortuneTextView: UITextView = {
        let textView = UITextView()
        let randomIntText = Int.random(in: 0..<10)
        let randomIntEnd = Int.random(in: 0..<1)
        textView.isEditable = false
        textView.text = "\(self.name + fortuneList[randomIntText] + endText[randomIntEnd])"
        textView.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        textView.textAlignment = .justified
        textView.textColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        textView.backgroundColor = UIColor(red: 1.00, green: 0.74, blue: 0.35, alpha: 1.00)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var sendButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.60, green: 0.38, blue: 0.22, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(gray: 1, alpha: 1)
        button.setTitle("Ana Sayfaya Dön", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return button
    }()
    
    convenience init(name: String) {
        self.init()
        self.name = "Sevgili \(name), "
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(false, forKey: "notification")
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.74, blue: 0.35, alpha: 1.00)
        
        self.view.addSubview(logoView)
        self.view.addSubview(infoLabel)
        self.view.addSubview(sendButton)
        self.view.addSubview(fortuneTextView)
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 150),
            logoView.heightAnchor.constraint(equalToConstant: 130),
            
            infoLabel.topAnchor.constraint(equalTo: self.logoView.bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            infoLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            infoLabel.heightAnchor.constraint(equalToConstant: 40),
            
            fortuneTextView.topAnchor.constraint(equalTo: self.infoLabel.bottomAnchor),
            fortuneTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            fortuneTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            fortuneTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            
            sendButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sendButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            sendButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc private func sendButtonTapped() {
        print("send")
        let vc = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
}
