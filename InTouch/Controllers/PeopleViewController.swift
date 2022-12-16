import UIKit

class PeopleViewController: UIViewController {
    
    //MARK: - Constants
    
    private let users: [User] = [
        User(username: "Nastenok", avatarImageString: "ava3", id: 1),
        User(username: "Kashchenko", avatarImageString: "ava1", id: 2),
        User(username: "Meow", avatarImageString: "ava2", id: 3),
        User(username: "Ruslan", avatarImageString: "ava4", id: 4)
    ]
    
    private var peopleCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collection
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<PeopleSection, User>?
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        view.backgroundColor = UIColor(named: KeysColor.listVCBackground.rawValue)
        setupCollectionView()
        createDataSource()
        reloadData()
    }
    
    
    
    //MARK: - CollectionView
    
    private func setupCollectionView() {
        peopleCollectionView = UICollectionView(frame: view.bounds,
                                                collectionViewLayout: createCompositionalLayout())
        peopleCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        peopleCollectionView.backgroundColor = UIColor(named: KeysColor.listVCBackground.rawValue)
        view.addSubview(peopleCollectionView)
        
        //Registe cell
        peopleCollectionView.register(UserChatCell.self, forCellWithReuseIdentifier: UserChatCell.reuseID)
        
        //Register headers
        peopleCollectionView.register(HeaderSection.self,
                                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                      withReuseIdentifier: HeaderSection.headerID)
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<PeopleSection, User>()
        snapshot.appendSections([.users])
        snapshot.appendItems(users, toSection: .users)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    //MARK: - SearchBar
    
    private func setupSearchBar() {
        let searchController = UISearchController()
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

//MARK: - CollectionView DataSource

extension PeopleViewController {
    
    private func createDataSource () {
        dataSource = UICollectionViewDiffableDataSource<PeopleSection, User>(collectionView: peopleCollectionView, cellProvider: { collectionView, indexPath, user in
            guard let section = PeopleSection(rawValue: indexPath.section) else {
                fatalError("unknown section kind")
            }
            
            switch section {
            case .users:
                return self.configure(collectionView: self.peopleCollectionView,
                                      cellType: UserChatCell.self,
                                      with: user,
                                      for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSection.headerID, for: indexPath) as? HeaderSection else {
                fatalError("Can not create new header")
            }
            
            guard let section = PeopleSection(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            let items = self.dataSource?.snapshot().numberOfItems(inSection: .users)
            sectionHeader.configure(textHeader: section.description(usersCount: items ?? 0), font: .systemFont(ofSize: 36, weight: .light), textColor: .label)
            
            return sectionHeader
        }
    }
}

//MARK: - CollectionView Setup layout

extension PeopleViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            guard let section = PeopleSection(rawValue: sectionIndex) else {
                fatalError("unknown section kind")
            }
            switch section {
            case .users:
                return self.createUsersSection()
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createUsersSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 2 )
        group.interItemSpacing = .fixed(15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 15,
                                                        bottom: 0, trailing: 15)
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        return sectionHeader
    }
}

//MARK: - UISearchBarDelegate

extension PeopleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
