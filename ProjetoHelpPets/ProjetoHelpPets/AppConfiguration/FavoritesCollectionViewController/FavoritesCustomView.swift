import UIKit

class FavoritesCustomView: UIView {
    
    private lazy var logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "LightLogo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var petName: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Júnior Alfredo Gomes"
        view.font = UIFont(name: "Futura", size: 16)
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
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
        self.addSubview(logoImage)
        self.addSubview(petName)
        
        NSLayoutConstraint.activate([
            petName.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            petName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    func configureComponentData(image: UIImage, text: String) {
        logoImage.image = image
    }
    
}
