import UIKit

class FindPetsCustomView: UIView {
    
    private lazy var petImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profileImage")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petName: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Júnior Alfredo Gomes"
        view.font = UIFont(name: "Futura", size: 18)
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var breed: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Raça:"
        view.font = UIFont(name: "Futura", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petBreed: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Golden"
        view.font = UIFont(name: "Futura", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var age: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Idade:"
        view.font = UIFont(name: "Futura", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petAge: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "9 meses"
        view.font = UIFont(name: "Futura", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var porte: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Idade:"
        view.font = UIFont(name: "Futura", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petPorte: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "9 meses"
        view.font = UIFont(name: "Futura", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var showInfoFavoritePet: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Conhecer Pet", for: .normal)
        view.backgroundColor = .orange
        view.setTitleColor(UIColor.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
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
    
    func buildLayout() {
        self.addSubview(petImage)
        self.addSubview(petName)
        self.addSubview(breed)
        self.addSubview(petBreed)
        self.addSubview(age)
        self.addSubview(petAge)
        self.addSubview(porte)
        self.addSubview(petPorte)
        self.addSubview(showInfoFavoritePet)
        
        NSLayoutConstraint.activate([
            petImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            petImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            petImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            petImage.bottomAnchor.constraint(equalTo: petName.topAnchor, constant: -10),
            petImage.heightAnchor.constraint(equalToConstant: 200),
            
            petName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            breed.topAnchor.constraint(equalTo: petName.bottomAnchor, constant: 15),
            breed.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            petBreed.centerYAnchor.constraint(equalTo: breed.centerYAnchor),
            petBreed.leadingAnchor.constraint(equalTo: breed.trailingAnchor, constant: 10),
            
            age.topAnchor.constraint(equalTo: breed.bottomAnchor, constant: 5),
            age.leadingAnchor.constraint(equalTo: breed.leadingAnchor),
            
            petAge.centerYAnchor.constraint(equalTo: age.centerYAnchor),
            petAge.leadingAnchor.constraint(equalTo: age.trailingAnchor, constant: 10),
            
            porte.topAnchor.constraint(equalTo: age.bottomAnchor, constant: 5),
            porte.leadingAnchor.constraint(equalTo: age.leadingAnchor),
            
            petPorte.centerYAnchor.constraint(equalTo: porte.centerYAnchor),
            petPorte.leadingAnchor.constraint(equalTo: age.trailingAnchor, constant: 10),
            
            showInfoFavoritePet.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            showInfoFavoritePet.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            showInfoFavoritePet.heightAnchor.constraint(equalToConstant: 45),
            showInfoFavoritePet.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    func configureComponentData(image: UIImage, text: String) {
        petImage.image = image
    }
    
}
