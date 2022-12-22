import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    
    func register(email: String, password: String, confirmPassword: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let result = result {
                completion(.success(result.user))
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let result = result {
                completion(.success(result.user))
            }
        }
    }
}
