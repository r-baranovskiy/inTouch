import UIKit

class StartView: UIView {
    
    //MARK: - Constants
    
    private var timeIntervalAnimate = 0.5
    private var backgroundImageView: UIImageView {
        return UIImageView(image: UIImage(named: KeysImages.backgroundImage.rawValue))
    }
    
    //Labels
    private let mainLabel = UILabel(text: "",
                                    font: UIFont(name: KeysFont.logoFont.rawValue,
                                                 size: 80),
                                    textColor: .label,
                                    adjustsFontSizeToFitWidth: true,
                                    alignment: .center)
    
    private let communicatePropertyLabel = UILabel(text: "📨  Общайся со своими друзьями",
                                                   font: .propertyFont(),
                                                   textColor: .label,
                                                   adjustsFontSizeToFitWidth: true)
    
    private let sharePhotosLabel = UILabel(text: "🏞️  Делись фото и видео",
                                           font: .propertyFont(),
                                           textColor: .label,
                                           adjustsFontSizeToFitWidth: true)
    
    private let shareLocationLabel = UILabel(text: "⛱️  Покажи где ты находишься",
                                             font: .propertyFont(),
                                             textColor: .label,
                                             adjustsFontSizeToFitWidth: true)
    
    private let stayInTouchLabel = UILabel(text: "🌝  Оставайся всегда на связи",
                                           font: .propertyFont(),
                                           textColor: .label,
                                           adjustsFontSizeToFitWidth: true)
    
    //Buttons
    let loginButton = CustomButton(text: "Войти", isShadow: true)
    let registerButton = CustomButton(text: "Регистрация", isShadow: true)
    
    //Containers
    private var propertyStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        showAnimatedMainLabel()
        configurePropertyStackView()
        configureButtonsStackView()
        backgroundImageView.frame = self.frame
        
        addSubview(backgroundImageView)
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
                self.sharePhotosLabel.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: time) {
                    self.shareLocationLabel.alpha = 1
                } completion: { _ in
                    UIView.animate(withDuration: time) {
                        self.stayInTouchLabel.alpha = 1
                    } completion: { _ in
                        UIView.animate(withDuration: time) {
                            self.registerButton.isHidden = false
                            self.loginButton.isHidden = false
                            self.registerButton.alpha = 0.7
                            self.loginButton.alpha = 0.7
                        }
                    }
                }
            }
        }
    }
    
    private func configurePropertyStackView() {
        propertyStackView = UIStackView(arrangedSubviews:
                                            [communicatePropertyLabel,
                                             sharePhotosLabel,
                                             shareLocationLabel,
                                             stayInTouchLabel],
                                        axis: .vertical,
                                        spacing: 20,
                                        alignment: .leading)
        
        for property in propertyStackView.arrangedSubviews {
            property.alpha = 0
        }
    }
    
    private func configureButtonsStackView() {
        buttonsStackView = UIStackView(arrangedSubviews:
                                        [loginButton,
                                         registerButton],
                                       axis: .vertical,
                                       spacing: 20,
                                       alignment: .fill)
        
        for element in buttonsStackView.arrangedSubviews {
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
            
            buttonsStackView.topAnchor.constraint(greaterThanOrEqualTo: propertyStackView.bottomAnchor, constant: 50),
            buttonsStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
        ])
    }
}
