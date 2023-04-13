//
//  NewsDetailsTableViewController.swift
//  MVVM
//
//  Created by Татьяна Аникина on 13.02.2022.
//

import UIKit
import UIKit

class NewsDetailsTableViewController : UIViewController {
    
    
    var viewModel: NewsDetalisViewModelProtocol! {
        didSet {
            
            authorLabel.text = viewModel.author
            titleLabel.text = viewModel.title
            descriptionLabel.text = viewModel.description
            
            guard let imageURL = viewModel.imageData else { return }
            imageURLView.image = UIImage(data: imageURL)
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd, yyyy"

            let date: Date? = dateFormatterGet.date(from: viewModel.dateOfPublic ?? "")
            if let dateString = date {
                dataOfPublicLabel.text = dateFormatterPrint.string(from: dateString)
            }
        }
    }
    
    fileprivate(set) lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.numberOfLines = 0
        
        return label
    }()
    
    fileprivate(set) lazy var dataOfPublicLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.numberOfLines = 0

        return label
    }()
    
    fileprivate(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.textColor = UIColor.black
        label.numberOfLines = 0

        return label
    }()
    
    fileprivate(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.numberOfLines = 0

        return label
    }()
    
    fileprivate(set) lazy var imageURLView: UIImageView = {
      let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
      
      return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        addSubviews()
        makeConstraints()
    }
    
        
        func addSubviews() {
            view.addSubview(titleLabel)
            view.addSubview(imageURLView)
            view.addSubview(descriptionLabel)
        }
        
        func makeConstraints() {
        
            titleLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(86)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-6)
                make.bottom.equalTo(imageURLView.snp.top).offset(-20)
            }

            imageURLView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.left.equalTo(titleLabel.snp.left)
                make.right.equalTo(titleLabel.snp.right)
                make.size.width.equalTo(300)
                make.size.height.equalTo(150)
            }
            
            descriptionLabel.snp.makeConstraints { (make) in
                make.top.equalTo(imageURLView.snp.bottom).offset(20)
                make.left.equalTo(titleLabel.snp.left)
                make.right.equalToSuperview().offset(-6)
            }
        }
    }
