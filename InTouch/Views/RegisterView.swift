import UIKit

class RegisterView: UIView {
    
    //MARK: - Constants
    
    private var backgroundImageView: UIImageView {
        return UIImageView(image: UIImage(named: KeysImages.backgroundImage.rawValue))
    }
    let backgroundButtonColor = UIColor(named: KeysColor.buttonsBackColor.rawValue) ?? .gray
    
    var backButton = UIButton()
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        createBackButton()
        
        addSubview(backgroundImageView)
        addSubiewWithoutAutoresizing(backButton)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func createBackButton() {
        backButton = UIButton(type: .system)
            .initButton(title: "Назад",
                        titleFor: .normal,
                        titleFont: .boldSystemFont(ofSize: 30),
                        backColor: backgroundButtonColor,
                        titleColor: .label,
                        titleColorFor: .normal,
                        radius: 12)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            backButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
