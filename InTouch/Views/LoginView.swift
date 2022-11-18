import UIKit

class LoginView: UIView {
    
    //MARK: - Constants
    
    private var backgroundImageView: UIImageView {
        return UIImageView(image: UIImage(named: KeysImages.backgroundImage.rawValue))
    }
    
    private var backButton = UIButton()
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(backgroundImageView)
        addSubiewWithoutAutoresizing(backButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
