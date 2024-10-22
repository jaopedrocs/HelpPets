import UIKit

class ThirdContainer: UIView {
    
    private lazy var thirdContainerTopImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var thirdContainerTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Nossa Missão"
        view.textColor = UIColor(named: "LabelColor")
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var thirdContainerContent: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Help Pets é um projeto dedicado a conectar pessoas que desejam adotar um Pet com aquelas que estão colocando os seus para adoção. A plataforma facilita o processo de adoção ao fornecer um espaço seguro, eficiente e informativo, onde os doadores podem criar publicações detalhadas sobre os Pets disponíveis, e os adotantes podem encontrar o Pet ideal"
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.textColor = .black
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
        self.addSubview(thirdContainerTitle)
        self.addSubview(thirdContainerContent)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 300),
            thirdContainerTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            thirdContainerTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            thirdContainerTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            thirdContainerContent.topAnchor.constraint(equalTo: thirdContainerTitle.bottomAnchor, constant: 10),
            thirdContainerContent.leadingAnchor.constraint(equalTo: thirdContainerTitle.leadingAnchor),
            thirdContainerContent.trailingAnchor.constraint(equalTo: thirdContainerTitle.trailingAnchor),
        ])
        
    }
}
