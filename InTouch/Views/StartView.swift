import UIKit

class StartView: UIView {
    
    //MARK: - Constants
    private var timeIntervalAnimate = 0.5
    
    private var mainLabel = UILabel()
    
    private var propertyStackView = UIStackView()
    private var communicatePropertyLabel = UILabel()
    private var sharePropertyLabel = UILabel()
    private var shareLocationLabel = UILabel()
    private var stayInTouchLabel = UILabel()
    
    private var buttonsStackView = UIStackView()
    var logInButton = UIButton()
    var registerButton = UIButton()
    
    private var backgroundImageView: UIImageView {
        return UIImageView(image: UIImage(named: KeysImages.backgroundImage.rawValue))
    }
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        showAnimatedMainLabel()
        configurePropertyStackView()
        configureButtonsStackView()
        
        backgroundImageView.frame = self.frame
        
        addSubiewWithoutAutoresizing(backgroundImageView)
        addSubiewWithoutAutoresizing(mainLabel)
        addSubiewWithoutAutoresizing(propertyStackView)
        addSubiewWithoutAutoresizing(buttonsStackView)
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings UI
    
    private func showAnimatedMainLabel() {
        let nameLabel = "In Touch"
        var charIndex = 0.0
        mainLabel = UILabel()
            .initLabel(text: "",
                       font: UIFont(name: KeysFont.logoFont.rawValue, size: 80)
                       ?? .systemFont(ofSize: 80),
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
                    } completion: { _ in
                        UIView.animate(withDuration: time) {
                            self.registerButton.isHidden = false
                            self.logInButton.isHidden = false
                            self.registerButton.alpha = 0.7
                            self.logInButton.alpha = 0.7
                        }
                    }
                }
            }
        }
    }
    
    private func configurePropertyStackView() {
        var labelFont: UIFont {
            return UIFont(name: "MarkerFelt-Thin", size: 20) ?? .systemFont(ofSize: 20)
        }
        
        communicatePropertyLabel = UILabel()
            .initLabel(text: "📨  Общайся со своими друзьями",
                       font: labelFont,
                       color: .label,
                       textAlignment: .left,
                       adjustsFontSizeToFitWidth: true,
                       minimumScaleFactor: 0.5)
        
        sharePropertyLabel = UILabel()
            .initLabel(text: "🏞️  Делись фото и видео",
                       font: labelFont,
                       color: .label,
                       textAlignment: .left,
                       adjustsFontSizeToFitWidth: true,
                       minimumScaleFactor: 0.5)
        
        shareLocationLabel = UILabel()
            .initLabel(text: "⛱️  Покажи где ты находишься",
                       font: labelFont,
                       color: .label,
                       textAlignment: .left,
                       adjustsFontSizeToFitWidth: true,
                       minimumScaleFactor: 0.5)
        
        stayInTouchLabel = UILabel()
            .initLabel(text: "🌝  Оставайся всегда на связи",
                       font: labelFont,
                       color: .label,
                       textAlignment: .left,
                       adjustsFontSizeToFitWidth: true,
                       minimumScaleFactor: 0.5)
        
        
        let properties = [communicatePropertyLabel,
                          sharePropertyLabel,
                          shareLocationLabel,
                          stayInTouchLabel]
        
        propertyStackView.spacing = 20
        propertyStackView.axis = .vertical
        propertyStackView.alignment = .leading
        
        for property in properties {
            propertyStackView.addArrangedSubview(property)
            property.alpha = 0
        }
    }
    
    private func configureButtonsStackView() {
        logInButton = UIButton(type: .system)
            .initButton(title: "Вход",
                        titleFor: .normal,
                        titleFont: .boldSystemFont(ofSize: 30),
                        backColor: .gray,
                        titleColor: .label,
                        titleColorFor: .normal,
                        radius: 10)
        
        registerButton = UIButton(type: .system)
            .initButton(title: "Регистрация",
                        titleFor: .normal,
                        titleFont: .boldSystemFont(ofSize: 30),
                        backColor: .gray,
                        titleColor: .label,
                        titleColorFor: .normal,
                        radius: 10)
        
        let elements = [logInButton, registerButton]
        
        buttonsStackView.spacing = 20
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fill
        
        for element in elements {
            buttonsStackView.addArrangedSubview(element)
            element.isHidden = true
            element.alpha = 0
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
            propertyStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            buttonsStackView.topAnchor.constraint(equalTo: propertyStackView.bottomAnchor, constant: 30),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
        ])
    }
}
