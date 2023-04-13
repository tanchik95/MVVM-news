//
//  NewsTableViewCell.swift
//  MVVM
//
//  Created by Татьяна Аникина on 31.01.2022.
//


import UIKit
import SnapKit

// MARK: - View Metrics
extension NewsTableViewCell {
  struct ViewMetrics {
    let backgroundColor = UIColor.white
  }
}

class NewsTableViewCell: UITableViewCell {
    
    private var viewMetrics = ViewMetrics()

    var viewModel: NewsTableViewCellViewModelProtocol! {
        didSet {
            titleLabel.text = viewModel.title
            authorLabel.text = viewModel.author
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
        label.textColor = UIColor.gray
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
    
    fileprivate(set) lazy var dataOfPublicLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.textColor = UIColor.systemBlue
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
    
    fileprivate(set) lazy var circleView: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        view.layer.cornerRadius = 2
       

      return view
    }()
    
    fileprivate(set) lazy var verticalView: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor.gray

      return view
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      func initialSetup() {
        func setupView() {
          backgroundColor = viewMetrics.backgroundColor
        }
        
        func addSubviews() {
          addSubview(titleLabel)
          addSubview(authorLabel)
          addSubview(imageURLView)
          addSubview(dataOfPublicLabel)
          addSubview(circleView)
          addSubview(verticalView)
        
        }
        
        func makeConstraints() {
            dataOfPublicLabel.snp.makeConstraints { (make) in
              make.top.equalToSuperview().offset(2)
              make.left.equalToSuperview().offset(16)
              make.right.equalToSuperview().offset(-6)
          }
            titleLabel.snp.makeConstraints { (make) in
                make.top.equalTo(dataOfPublicLabel.snp.bottom).offset(8)
                make.left.equalTo(dataOfPublicLabel.snp.left)
                make.bottom.equalTo(authorLabel.snp.top).offset(-10)
                make.right.equalTo(imageURLView.snp.left).offset(-10)
            }
            
            imageURLView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-10)
                make.left.equalTo(titleLabel.snp.right).offset(10)
                make.size.width.equalTo(120)
                make.size.height.equalTo(120)
            }
            
            authorLabel.snp.makeConstraints { (make) in
                make.top.equalTo(titleLabel.snp.bottom).offset(10)
                make.left.equalTo(titleLabel.snp.left)
            }
            
            circleView.snp.makeConstraints { (make) in
                make.centerY.equalTo(dataOfPublicLabel.snp.centerY)
                make.size.width.equalTo(4)
                make.size.height.equalTo(4)
            }
            
            verticalView.snp.makeConstraints { (make) in
                make.top.equalTo(circleView.snp.bottom).offset(6)
                make.left.equalToSuperview().offset(4)
                make.bottom.equalToSuperview().offset(-8)
                make.right.equalTo(dataOfPublicLabel.snp.left).offset(-16)
                make.width.equalTo(2)
                make.centerX.equalTo(circleView.snp.centerX)
            }
        }
        
        setupView()
        addSubviews()
        makeConstraints()
      }
      
      initialSetup()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
