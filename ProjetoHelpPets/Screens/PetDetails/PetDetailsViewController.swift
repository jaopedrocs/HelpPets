import UIKit

class PetDetailsViewController: UIViewController {
    
    private lazy var detailsPetTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Conheça o Pet"
        view.textColor = UIColor(named: "LabelColor")
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "profileImage")
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petName: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Júnior Alfredo Gomes"
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var anyPetInformarions: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Algumas Informações do Pet:"
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petInformation: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Pet Description Pet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet DescriptionPet"
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var favoritePet: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "heart"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var goToChat: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Converse com o dono", for: .normal)
        view.backgroundColor = .orange
        view.tintColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        constraintsConfiguration()
    }
    
    func viewConfiguration() {
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
        view.addSubview(detailsPetTitle)
        view.addSubview(petImage)
        view.addSubview(petName)
        view.addSubview(anyPetInformarions)
        view.addSubview(petInformation)
        view.addSubview(favoritePet)
        view.addSubview(goToChat)
    }
    
    func constraintsConfiguration() {
        NSLayoutConstraint.activate([
            detailsPetTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsPetTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsPetTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            petImage.topAnchor.constraint(equalTo: detailsPetTitle.bottomAnchor, constant: 25),
            petImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            petImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            petImage.heightAnchor.constraint(equalToConstant: 260),
            
            petName.topAnchor.constraint(equalTo: petImage.bottomAnchor, constant: 17),
            petName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            petName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            anyPetInformarions.topAnchor.constraint(equalTo: petName.bottomAnchor, constant: 17),
            anyPetInformarions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            anyPetInformarions.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            petInformation.topAnchor.constraint(equalTo: anyPetInformarions.bottomAnchor, constant: 15),
            petInformation.leadingAnchor.constraint(equalTo: anyPetInformarions.leadingAnchor),
            petInformation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            goToChat.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            goToChat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            goToChat.heightAnchor.constraint(equalToConstant: 45),
            goToChat.widthAnchor.constraint(equalToConstant: 220),
            
            favoritePet.centerYAnchor.constraint(equalTo: goToChat.centerYAnchor),
            favoritePet.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ])
    }

}
