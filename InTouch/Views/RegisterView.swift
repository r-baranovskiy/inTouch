import UIKit

class RegisterView: UIView {
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(named: KeysColor.registerBackColor.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
