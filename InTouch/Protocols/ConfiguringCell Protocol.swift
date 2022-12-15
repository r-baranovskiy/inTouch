import Foundation

protocol SelfConfiguringCell {
    static var reuseID: String { get }
    func configure(with value: MChat)
}
