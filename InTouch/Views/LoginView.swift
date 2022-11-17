import UIKit

class LoginView: UIView {
    
    //MARK: - Constants
    
    private var mainLabel = UILabel()
    private var propertyStackView = UIStackView()
    private var communicatePropertyLabel = UILabel()
    private var sharePropertyLabel = UILabel()
    private var shareLocationLabel = UILabel()
    private var stayInTouchLabel = UILabel()
    private var logInButton = UIButton()
    private var registerButton = UIButton()
    
    private var timeIntervalAnimate = 0.5
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(named: KeysColor.loginBackColor.rawValue)
        showAnimatedMainLabel()
        configurePropertyStackView()
        
        addSubiewWithoutAutoresizing(mainLabel)
        addSubiewWithoutAutoresizing(propertyStackView)
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings UI
    
    private func showAnimatedMainLabel() {
        let nameLabel = "In Touch"
        var charIndex = 0.0
        mainLabel = UILabel().initLabel(text: "",
                                        font: UIFont(name: KeysFont.logoFont.rawValue, size: 80) ?? .systemFont(ofSize: 80),
                                        color: .label,
                                        textAlignment: .center,
                                        adjustsFontSizeToFitWidth: true,
                                        minimumScaleFactor: 0.5)
        
        
        for char in nameLabel {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { _ in
                self.mainLabel.text?.append(char)
            }
            charIndex += 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { _ in
            self.showAnimatedPropertiest()
        }
    }
    
    @objc private func showAnimatedPropertiest() {
        let time = timeIntervalAnimate
        UIView.animate(withDuration: time) {
            self.communicatePropertyLabel.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: time) {
                self.sharePropertyLabel.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: time) {
                    self.shareLocationLabel.alpha = 1
                } completion: { _ in
                    UIView.animate(withDuration: time) {
                        self.stayInTouchLabel.alpha = 1
                    }
                }
            }
        }
    }
    
    private func configurePropertyStackView() {
        communicatePropertyLabel = UILabel().initLabel(text: "📨  Общайся со своими друзьями",
                                                       font: UIFont(name: "Papyrus", size: 20) ?? .systemFont(ofSize: 20),
                                                       color: .label,
                                                       textAlignment: .left,
                                                       adjustsFontSizeToFitWidth: true,
                                                       minimumScaleFactor: 0.5)
        
        sharePropertyLabel = UILabel().initLabel(text: "🏞️  Делись фото и видео",
                                                 font: UIFont(name: "Papyrus", size: 20) ?? .systemFont(ofSize: 20),
                                                 color: .label,
                                                 textAlignment: .left,
                                                 adjustsFontSizeToFitWidth: true,
                                                 minimumScaleFactor: 0.5)
        
        shareLocationLabel = UILabel().initLabel(text: "⛱️  Покажи где ты находишься",
                                                 font: UIFont(name: "Papyrus", size: 20) ?? .systemFont(ofSize: 20),
                                                 color: .label,
                                                 textAlignment: .left,
                                                 adjustsFontSizeToFitWidth: true,
                                                 minimumScaleFactor: 0.5)
        
        stayInTouchLabel = UILabel().initLabel(text: "🌝  Оставайся всегда на связи",
                                               font: UIFont(name: "Papyrus", size: 20) ?? .systemFont(ofSize: 20),
                                               color: .label,
                                               textAlignment: .left,
                                               adjustsFontSizeToFitWidth: true,
                                               minimumScaleFactor: 0.5)
        
        
        let properties = [communicatePropertyLabel, sharePropertyLabel, shareLocationLabel, stayInTouchLabel]
        
        propertyStackView.spacing = 20
        propertyStackView.axis = .vertical
        propertyStackView.alignment = .leading
        
        for property in properties {
            propertyStackView.addArrangedSubview(property)
            property.alpha = 0
        }
        
    }
    
    
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            mainLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            propertyStackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 50),
            propertyStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            propertyStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
}
