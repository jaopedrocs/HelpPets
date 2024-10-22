import UIKit

class FirstContainer: UIView {

    private lazy var firstContainerTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Uma forma prática, rápida e segura de adotar seu pet!"
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textColor = UIColor(named: "LabelColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstContainerContent: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Quer adotar um pet, mas as redes socias e plataformas não estão colaborando? Vem que a Help Pets te ajuda!"
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstContainerGoToFindPetsButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Quero meu Pet", for: .normal)
        view.backgroundColor = .orange
        view.setTitleColor(UIColor.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstContainerBottomImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "firstHomeContainerBottomImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        buildLayout()
    }
    
    private func buildLayout() {
        self.addSubview(firstContainerTitle)
        self.addSubview(firstContainerContent)
        self.addSubview(firstContainerGoToFindPetsButton)
        self.addSubview(firstContainerBottomImage)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 300),
            
            firstContainerTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            firstContainerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            firstContainerTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            firstContainerContent.topAnchor.constraint(equalTo: firstContainerTitle.bottomAnchor, constant: 10),
            firstContainerContent.leadingAnchor.constraint(equalTo: firstContainerTitle.leadingAnchor),
            firstContainerContent.trailingAnchor.constraint(equalTo: firstContainerTitle.trailingAnchor),
            
            firstContainerGoToFindPetsButton.topAnchor.constraint(equalTo: firstContainerContent.bottomAnchor, constant: 20),
            firstContainerGoToFindPetsButton.leadingAnchor.constraint(equalTo: firstContainerContent.leadingAnchor),
            firstContainerGoToFindPetsButton.widthAnchor.constraint(equalToConstant: 130),
            firstContainerGoToFindPetsButton.heightAnchor.constraint(equalToConstant: 45),
            
            firstContainerBottomImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            firstContainerBottomImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstContainerBottomImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
