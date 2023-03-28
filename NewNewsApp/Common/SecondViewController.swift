//
//  SecondViewController.swift
//  NewNewsApp
//
//  Created by Nurlan Seitov on 27/3/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    public var name: String?
    public var infoName: String?
    public var imageName: String = ""
    
    let labelName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        return label
    } ()
    
    let labelInfo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .left
        label.textColor = .black
        return label
    } ()
    
    let imagView: UIImageView = {
        let image = UIImageView()
        return image
        
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()

        config2()
        setupConstraints2()
        
    }
    public func config2(){
        view.backgroundColor = .white
       // title = "Extended information"
       
        view.addSubview(labelName)
        view.addSubview(labelInfo)
        view.addSubview(imagView)
        
        labelName.text = name ?? "emty"
        labelInfo.text = infoName ?? "emty"
        imagView.image = UIImage(named: imageName)
        
        imagView.layer.cornerRadius = 10
        imagView.layer.borderWidth = 2
        imagView.layer.borderColor = UIColor.gray.cgColor
        imagView.clipsToBounds = true
        imagView.contentMode.self = .scaleAspectFill
       
    }
    public func setupConstraints2() {
       
        labelName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(80)
        }
        labelInfo.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(labelName.snp.bottom).offset(20)
            make.height.equalTo(210)

        }
        imagView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(labelInfo.snp.bottom).offset(20)
            make.height.equalTo(200)

        }
    }
        

}
