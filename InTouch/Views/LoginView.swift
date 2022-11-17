import UIKit

class LoginView: UIView {
    
    //MARK: - Constants
    
    private var mainLabel = UILabel()
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(named: KeysColor.loginBackColor.rawValue)
        showAnimatedMainLabel()
        addSubiewWithoutAutoresizing(mainLabel)
        
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Settings UI
    
    private func showAnimatedMainLabel() {
        let nameLabel = "In Touch"
        var charIndex = 0.0
        mainLabel.text = ""
        mainLabel.font = UIFont(name: KeysFont.logoFont.rawValue, size: 80)
        mainLabel.textColor = .black
        mainLabel.textAlignment = .center
        mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.minimumScaleFactor = 0.5
        
        for char in nameLabel {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { _ in
                self.mainLabel.text?.append(char)
            }
            charIndex += 1
        }
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            mainLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            mainLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
        ])
    }
    
}
