//
//  MainView.swift
//  Xylophone
//
//  Created by Ilyas Tyumenev on 30.07.2023.
//

import UIKit
import SnapKit

protocol MainViewDelegate: AnyObject {
    func mainView(_ view: MainView, buttonPressed button: UIButton)
}

class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    // MARK: - Private Properties
    private let cButton: UIButton = {
        let button = UIButton()
        button.setTitle("C", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        button.setTitleShadowColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let dButton: UIButton = {
        let button = UIButton()
        button.setTitle("D", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        button.setTitleShadowColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let eButton: UIButton = {
        let button = UIButton()
        button.setTitle("E", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        button.setTitleShadowColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let fButton: UIButton = {
        let button = UIButton()
        button.setTitle("F", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        button.setTitleShadowColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let gButton: UIButton = {
        let button = UIButton()
        button.setTitle("G", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        button.setTitleShadowColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .systemIndigo
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let aButton: UIButton = {
        let button = UIButton()
        button.setTitle("A", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        button.setTitleShadowColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private let bButton: UIButton = {
        let button = UIButton()
        button.setTitle("B", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        button.setTitleShadowColor(.lightGray, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8.0
        [self.cButton,
         self.dButton,
         self.eButton,
         self.fButton,
         self.gButton,
         self.aButton,
         self.bButton].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        addSubview(stackView)
    }
    
    private func addConstraints() {
        stackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        cButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
        }
        
        dButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        eButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        fButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
        }
        
        gButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        aButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(35)
        }
        
        bButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }
}

// MARK: - Target Actions
private extension MainView {
    
    @objc func buttonPressed(_ button: UIButton) {
        delegate?.mainView(self, buttonPressed: button)
    }
}
