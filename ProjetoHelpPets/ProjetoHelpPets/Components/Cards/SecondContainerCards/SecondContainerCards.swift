import UIKit

class SecondContainerCards: UIView {

    private lazy var cardImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "profileImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "a"
        view.textColor = UIColor(named: "LabelColor")
        view.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardContent: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "b"
        view.font = UIFont.systemFont(ofSize: 17)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Saiba Mais", for: .normal)
        view.backgroundColor = .orange
        view.setTitleColor(UIColor.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.layer.cornerRadius = 15
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
        self.addSubview(cardImage)
        self.addSubview(cardTitle)
        self.addSubview(cardContent)
        self.addSubview(cardButton)
        
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: self.topAnchor),
            cardImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: 260),
            
            cardTitle.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 10),
            cardTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            cardContent.topAnchor.constraint(equalTo: cardTitle.bottomAnchor, constant: 5),
            cardContent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            cardContent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            cardButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            cardButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardButton.widthAnchor.constraint(equalToConstant: 135),
            cardButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func configureComponentData(title: String, content: String) {
        cardTitle.text = title
        cardContent.text = content
    }
    
}
