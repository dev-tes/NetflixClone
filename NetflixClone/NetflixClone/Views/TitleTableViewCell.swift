//
//  TitleTableViewCell.swift
//  NetflixClone
//
//  Created by Tes on 15/04/2022.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
    
    private let titlesPosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView .translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        let titlesPosterUIImageViewConstraint: [NSLayoutConstraint] = [
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImageView.topAnchor.constraint(equalTo:  contentView.topAnchor, constant: 15),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100),
        ]
//
//        let titleLabelConstraint: [NSLayoutConstraint] = []
//        let playTitleButtonConstraint: [NSLayoutConstraint] = []
        
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraint)
    }
    
    func configure(with model: TitleViewModel){
        guard let url = URL(string: model.posterURL) else { return }
        titlesPosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
}
