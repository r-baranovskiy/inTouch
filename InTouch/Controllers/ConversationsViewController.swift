import UIKit

struct MChat: Hashable {
    var username: String
    var userImage: UIImage
    var lastMessge: String
    var id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}

class ConversationsViewController: UIViewController {
    
    //MARK: - CollectionView Constants
    
    private let activeChat: [MChat] = [
        MChat(username: "Ruslan", userImage: UIImage(named: "ava1")!, lastMessge: "How are you?"),
        MChat(username: "Nastenok", userImage: UIImage(named: "ava3")!, lastMessge: "I hate you"),
        MChat(username: "Kotik", userImage: UIImage(named: "ava2")!, lastMessge: "Meow"),
        MChat(username: "Kashchenko", userImage: UIImage(named: "ava4")!, lastMessge: "САЛАМ ВСЕМ")
    ]
    
    private let waitingChat: [MChat] = [
        MChat(username: "Ruslan", userImage: UIImage(named: "ava1")!, lastMessge: "Add me please"),
        MChat(username: "Nastenok", userImage: UIImage(named: "ava3")!, lastMessge: "ДОБАВЬ МЕНЯ"),
        MChat(username: "Kotik", userImage: UIImage(named: "ava2")!, lastMessge: "КЕК"),
        MChat(username: "Kashchenko", userImage: UIImage(named: "ava4")!, lastMessge: "ВЧОМ ТЫ?")
    ]
    
    private var conversationsCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collection
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchBar()
        createDataSource()
        reloadData()
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
    
    //MARK: - Collection View
    
    private func setupCollectionView() {
        conversationsCollectionView = UICollectionView(frame: view.bounds,
                                                       collectionViewLayout: setupCompositionalLayout())
        conversationsCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        conversationsCollectionView.backgroundColor = UIColor(named: KeysColor.listVCBackground.rawValue)
        view.addSubview(conversationsCollectionView)
        
        //Register headers
        conversationsCollectionView.register(HeaderSection.self,
                                             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                             withReuseIdentifier: HeaderSection.headerID)
        
        //Register cells
        conversationsCollectionView.register(ActiveChatCell.self,
                                             forCellWithReuseIdentifier: ActiveChatCell.reuseID)
        conversationsCollectionView.register(WaitingChatCell.self,
                                             forCellWithReuseIdentifier: WaitingChatCell.reuseID)
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.waitingChat, .activeChats])
        snapshot.appendItems(waitingChat, toSection: .waitingChat)
        snapshot.appendItems(activeChat, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

//MARK: - Data Source

extension ConversationsViewController {
    
    private func configure<T: SelfConfiguringCell>(cellType: T.Type,
                                                   with value: MChat,
                                                   for indexPath: IndexPath) -> T {
        guard let cell = conversationsCollectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else { fatalError("Unable to dequare \(cellType.reuseID)") }
        cell.configure(with: value )
        return cell
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: conversationsCollectionView, cellProvider: { collectionView, indexPath, chat in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            switch section {
                
            case .activeChats:
                return self.configure(cellType: ActiveChatCell.self,
                                      with: chat, for: indexPath)
            case .waitingChat:
                return self.configure(cellType: WaitingChatCell.self,
                                      with: chat, for: indexPath)
            }
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSection.headerID, for: indexPath) as? HeaderSection else {
                fatalError("Can not create new header")
            }
            
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            sectionHeader.configure(textHeader: section.description())
            
            return sectionHeader
        }
    }
}

//MARK: - Setup layout

extension ConversationsViewController {
    
    private func setupCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("unknown section kind")
            }
            
            switch section {
            case .activeChats:
                return self.createActiveChatSection()
            case .waitingChat:
                return self.createWaitingChatSection()
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func createActiveChatSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20,
                                                             bottom: 0, trailing: 20)
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func createWaitingChatSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88),
                                               heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20,
                                                        bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
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

extension ConversationsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
