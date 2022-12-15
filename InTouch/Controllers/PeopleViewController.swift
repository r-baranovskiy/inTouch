import UIKit

class PeopleViewController: UIViewController {
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        view.backgroundColor = UIColor(named: KeysColor.listVCBackground.rawValue)
    }
    
    //MARK: - Appearance
    
    private func setupSearchBar() {
        let searchController = UISearchController()
//        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

//MARK: - UISearchBarDelegate

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
