import UIKit

class ChatsCustomView: UIView {

    private lazy var personImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profileImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petName: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Júnior Alfredo Gomes"
        view.font = UIFont(name: "Futura", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lastMessage: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Ultima mensagem recebida pelo usuario"
        view.font = UIFont(name: "Futura", size: 13)
        view.textColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var reciveMessage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "orangeDot")
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
    
    func buildLayout() {
        self.addSubview(personImage)
        self.addSubview(petName)
        self.addSubview(lastMessage)
        self.addSubview(reciveMessage)
        
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            personImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            personImage.trailingAnchor.constraint(equalTo: petName.leadingAnchor, constant: -10),
            personImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            personImage.widthAnchor.constraint(equalToConstant: 70),
            
            petName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 13),
            petName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 10),
            
            lastMessage.topAnchor.constraint(equalTo: petName.bottomAnchor, constant: 9),
            lastMessage.leadingAnchor.constraint(equalTo: petName.leadingAnchor, constant: 0),
            lastMessage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            reciveMessage.centerYAnchor.constraint(equalTo: petName.centerYAnchor),
            reciveMessage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            reciveMessage.heightAnchor.constraint(equalToConstant: 10),
            reciveMessage.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func configureComponentData(image: UIImage, text: String) {
        personImage.image = image
    }

}
