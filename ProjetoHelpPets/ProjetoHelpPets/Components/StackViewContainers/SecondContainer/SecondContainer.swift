import UIKit

class SecondContainer: UIView {
    
    private lazy var secondContainerTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "De uma reunião digital, até um encontro pessoal em ONGS. Confira alguns de nossos serviços:"
        view.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondContainerFirstCard: SecondContainerCards = {
        let view = SecondContainerCards()
        let title = "Nossa Missão"
        let content = "A Help Pets, irá te ajudar a adotar o seu Pet, ou colocá-lo para adoção, aqui todos se dão bem. Você, o próximo, e claro, o seu querido Pet"
        view.configureComponentData(title: title, content: content)
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondContainerSecondCard: SecondContainerCards = {
        let view = SecondContainerCards()
        let title = "Encontro Pessoal"
        let content = "Marque um encontro pessoal para conhecer seu novo pet, uma primeira visita é sempre bem vinda!"
        view.configureComponentData(title: title, content: content)
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondContainerThirdCard: SecondContainerCards = {
        let view = SecondContainerCards()
        let title = "Encontre O Pet Ideal"
        let content = "Encontre o pet ideal para você, em ongs ou eventos de adoção, a Help Pets te avisa quando e onde estará seu novo melhor amigo"
        view.configureComponentData(title: title, content: content)
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var secondContainerFourthCard: SecondContainerCards = {
        let view = SecondContainerCards()
        let title = "Reunião Digital"
        let content = "Marque uma vídeo chamada com o adotante do seu pet, basta chamar ele no chat e marcarem uma reunião"
        view.configureComponentData(title: title, content: content)
        view.backgroundColor = .white
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
        self.heightAnchor.constraint(equalToConstant: 2200).isActive = true
        self.backgroundColor = UIColor(named: "invertedBackgroundColor")
        configureSecondContainer()
    }

    private func configureSecondContainer() {
        
        self.addSubview(secondContainerTitle)
        self.addSubview(secondContainerFirstCard)
        self.addSubview(secondContainerSecondCard)
        self.addSubview(secondContainerThirdCard)
        self.addSubview(secondContainerFourthCard)
        
        NSLayoutConstraint.activate([
            secondContainerTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            secondContainerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            secondContainerTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            secondContainerFirstCard.topAnchor.constraint(equalTo: secondContainerTitle.bottomAnchor, constant: 25),
            secondContainerFirstCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            secondContainerFirstCard.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            secondContainerFirstCard.heightAnchor.constraint(equalToConstant: 470),
            
            secondContainerSecondCard.topAnchor.constraint(equalTo: secondContainerFirstCard.bottomAnchor, constant: 40),
            secondContainerSecondCard.leadingAnchor.constraint(equalTo: secondContainerFirstCard.leadingAnchor),
            secondContainerSecondCard.trailingAnchor.constraint(equalTo: secondContainerFirstCard.trailingAnchor),
            secondContainerSecondCard.heightAnchor.constraint(equalToConstant: 470),
            
            secondContainerThirdCard.topAnchor.constraint(equalTo: secondContainerSecondCard.bottomAnchor, constant: 40),
            secondContainerThirdCard.leadingAnchor.constraint(equalTo: secondContainerSecondCard.leadingAnchor),
            secondContainerThirdCard.trailingAnchor.constraint(equalTo: secondContainerSecondCard.trailingAnchor),
            secondContainerThirdCard.heightAnchor.constraint(equalToConstant: 470),
            
            secondContainerFourthCard.topAnchor.constraint(equalTo: secondContainerThirdCard.bottomAnchor, constant: 40),
            secondContainerFourthCard.leadingAnchor.constraint(equalTo: secondContainerThirdCard.leadingAnchor),
            secondContainerFourthCard.trailingAnchor.constraint(equalTo: secondContainerThirdCard.trailingAnchor),
            secondContainerFourthCard.heightAnchor.constraint(equalToConstant: 470)
        ])
    }
    
}
