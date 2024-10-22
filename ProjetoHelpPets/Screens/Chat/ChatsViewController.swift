import UIKit

class ChatsViewController: UIViewController {
   
    let padding: CGFloat = 16
    
    private lazy var headerComponent: HeaderComponent = {
        let view = HeaderComponent(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var chatTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor.white
        view.textAlignment = .left
        view.font = UIFont(name: "Helvetica", size: 15)
        view.attributedPlaceholder = NSAttributedString(string: "Busque pelo chat",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        view.layer.cornerRadius = 15
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 4
        return view
    }()
    
    private lazy var chatFilter: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var chatCollectionViewPets: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: .init())
        view.backgroundColor = .none
        view.register(ChatsCollectionViewCell.self, forCellWithReuseIdentifier: ChatsCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 20
        view.setCollectionViewLayout(layout, animated: false)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        subViewsConstraintsConfiguration()
    }
    
    func viewConfiguration() {
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
        view.addSubview(headerComponent)
        view.addSubview(chatTextField)
        view.addSubview(chatCollectionViewPets)
        chatCollectionViewPets.dataSource = self
        chatCollectionViewPets.delegate = self
        navigationController?.isNavigationBarHidden = true
    }
    
    func subViewsConstraintsConfiguration() {
        
        NSLayoutConstraint.activate([
            headerComponent.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerComponent.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            headerComponent.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            chatTextField.topAnchor.constraint(equalTo: headerComponent.bottomAnchor, constant: 10),
            chatTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            chatTextField.widthAnchor.constraint(equalToConstant: 260),
            chatTextField.heightAnchor.constraint(equalToConstant: 45),
            
            chatCollectionViewPets.topAnchor.constraint(equalTo: chatTextField.bottomAnchor, constant: 50),
            chatCollectionViewPets.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            chatCollectionViewPets.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            chatCollectionViewPets.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
}


extension ChatsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 75)
    }
}

extension ChatsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatsCollectionViewCell.identifier, for: indexPath) as? ChatsCollectionViewCell
        return cell ?? UICollectionViewCell()
         
    }
}

