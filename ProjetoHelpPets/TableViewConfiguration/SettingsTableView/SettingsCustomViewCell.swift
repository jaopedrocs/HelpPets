import UIKit

class SettingsCustomViewCell: UIView {
    
    lazy var cellTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Júnior Alfredo Gomes"
        view.font = UIFont(name: "Futura", size: 18)
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rightArrow: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "CaretRight")
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
        self.addSubview(cellTitle)
        self.addSubview(rightArrow)
        
        NSLayoutConstraint.activate([
            cellTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            cellTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            
            rightArrow.centerYAnchor.constraint(equalTo: cellTitle.centerYAnchor),
            rightArrow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            rightArrow.heightAnchor.constraint(equalToConstant: 20),
            rightArrow.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureComponentData(text: String) {
        cellTitle.text = text
    }


}
