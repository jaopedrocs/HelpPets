import UIKit

class PetRegisterViewController: UIViewController {
    
    let padding = 16
    
    private lazy var pickedPetImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var selectImageButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(systemName: "plus"), for: .normal)
        view.tintColor = UIColor.white
        view.backgroundColor = UIColor(named: "LabelColor")
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petName: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Nome do Pet:"
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petNameTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "Digite o nome do Pet",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.layer.cornerRadius = 18
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: Int(view.frame.height)))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petBreed: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Raça do Pet:"
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petBreedTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "Digite a raça do Pet",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.layer.cornerRadius = 18
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: Int(view.frame.height)))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petAge: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Idade do Pet:"
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petAgeTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "Digite a idade do Pet",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.layer.cornerRadius = 18
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: Int(view.frame.height)))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petRegisterButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cadastrar Pet", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Adicione informaçôes do Pet"
        view.addSubview(pickedPetImage)
        view.addSubview(selectImageButton)
        view.addSubview(petName)
        view.addSubview(petNameTextField)
        view.addSubview(petBreed)
        view.addSubview(petBreedTextField)
        view.addSubview(petAge)
        view.addSubview(petAgeTextField)
        view.addSubview(petRegisterButton)
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
        navigationController?.navigationBar.isHidden = false
        
        let backButton = UIBarButtonItem(title: "Voltar",
                                         style: .plain,
                                         target: self,
                                         action: #selector(dismissModal))
        navigationItem.leftBarButtonItem = backButton
        
        NSLayoutConstraint.activate([
            pickedPetImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            pickedPetImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickedPetImage.widthAnchor.constraint(equalToConstant: 150),
            pickedPetImage.heightAnchor.constraint(equalToConstant: 150),
            
            selectImageButton.centerYAnchor.constraint(equalTo: pickedPetImage.centerYAnchor),
            selectImageButton.leadingAnchor.constraint(equalTo: pickedPetImage.trailingAnchor,constant: 25),
            selectImageButton.heightAnchor.constraint(equalToConstant: 45),
            selectImageButton.widthAnchor.constraint(equalToConstant: 45),
            
            petName.topAnchor.constraint(equalTo: pickedPetImage.bottomAnchor, constant: 30),
            petName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            petName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            petNameTextField.topAnchor.constraint(equalTo: petName.bottomAnchor, constant: 15),
            petNameTextField.leadingAnchor.constraint(equalTo: petName.leadingAnchor),
            petNameTextField.widthAnchor.constraint(equalToConstant: 300),
            petNameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            petBreed.topAnchor.constraint(equalTo: petNameTextField.bottomAnchor, constant: 15),
            petBreed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            petBreed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            petBreedTextField.topAnchor.constraint(equalTo: petBreed.bottomAnchor, constant: 15),
            petBreedTextField.leadingAnchor.constraint(equalTo: petBreed.leadingAnchor),
            petBreedTextField.widthAnchor.constraint(equalToConstant: 300),
            petBreedTextField.heightAnchor.constraint(equalToConstant: 45),
            
            petAge.topAnchor.constraint(equalTo: petBreedTextField.bottomAnchor, constant: 15),
            petAge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            petAge.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            petAgeTextField.topAnchor.constraint(equalTo: petAge.bottomAnchor, constant: 15),
            petAgeTextField.leadingAnchor.constraint(equalTo: petAge.leadingAnchor),
            petAgeTextField.widthAnchor.constraint(equalToConstant: 300),
            petAgeTextField.heightAnchor.constraint(equalToConstant: 45),
            
            petRegisterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            petRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            petRegisterButton.widthAnchor.constraint(equalToConstant: 150),
            petRegisterButton.heightAnchor.constraint(equalToConstant: 45)
            
        ])
        selectImageButton.addTarget(self, action: #selector(y), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func y() {
        ImagePickerController().imagePicker(self) { imagem in
            self.pickedPetImage.image = imagem
        }
    }
    
    @objc func dismissModal() {
        dismiss(animated: true)
    }
}
