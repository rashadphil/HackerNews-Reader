//
//  StoryCell.swift
//  HackerNewsReader
//
//  Created by Rashad Philizaire on 6/24/22.
//

import Foundation
import UIKit

class StoryCell : UITableViewCell {
    
    var story : Story? {
        didSet {
            storyImage.image = story?.storyImage
            storyTitleLabel.text = story?.title
            storyUrlLabel.text = Utils.fullUrlToDisplayUrl(url: story?.url ?? "") 
            userLabel.text = story?.by.name
            scoreLabel.text = String((story?.score)!) + " l"
            commentsLabel.text = String((story?.commentCount)!) + " c"
        }
    }
    
    private let storyUrlLabel : UITextView = {
        let textview = UITextView()
        textview.isEditable = false
        textview.dataDetectorTypes = .link
        textview.font = UIFont.boldSystemFont(ofSize: 15)
        textview.textAlignment = .left
//        textview.backgroundColor = .red
        return textview
    }()
    
    private let storyTitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
//        label.backgroundColor = .green
        return label
    }()
    
    
    private let scoreLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
//        label.backgroundColor = .orange
        return label
    }()
    
    private let commentsLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
//        label.backgroundColor = .purple
        return label
    }()
    
    private let userLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
//        label.backgroundColor = .blue
        return label
    }()
    
    private let storyImage : UIImageView = {
        let img = UIImage(systemName: "heart.fill")
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
//        imgView.backgroundColor = .red
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(storyUrlLabel)
        addSubview(storyImage)
        addSubview(storyTitleLabel)
        
        storyImage.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 90, height: 0, enableInsets: false)
        
        storyUrlLabel.anchor(top: topAnchor, left: leftAnchor, bottom: storyUrlLabel.topAnchor, right: storyImage.leftAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 25, enableInsets: false)
        storyTitleLabel.anchor(top: storyUrlLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: storyImage.leftAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
        let stackView = UIStackView(arrangedSubviews: [scoreLabel, commentsLabel, userLabel])
//        stackView.backgroundColor = .red
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 0
        addSubview(stackView)
        stackView.anchor(top: storyTitleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: storyImage.leftAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 10, paddingRight: 10, width: 0, height: 0, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
    }
}
