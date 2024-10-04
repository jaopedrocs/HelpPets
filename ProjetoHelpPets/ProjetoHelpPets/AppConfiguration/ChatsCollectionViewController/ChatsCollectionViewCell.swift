import UIKit

class ChatsCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ChatsCustomCell"
    
    let customView: ChatsCustomView = {
        let view = ChatsCustomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(self.customView)
        backgroundColor = .white
        self.layer.cornerRadius = 7
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 4
        layoutConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutConfiguration() {
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: self.topAnchor),
            customView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
