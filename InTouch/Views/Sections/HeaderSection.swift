import UIKit

class HeaderSection: UICollectionReusableView {
    
    static let headerID = "HeaderSection"
    
    private var headerTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubiewWithoutAutoresizing(headerTitle)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(textHeader: String) {
        headerTitle.text = textHeader
        headerTitle.font = .laoSangamMN20()
        headerTitle.textColor = UIColor(named: KeysColor.headerColor.rawValue)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerTitle.topAnchor.constraint(equalTo: topAnchor),
            headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
