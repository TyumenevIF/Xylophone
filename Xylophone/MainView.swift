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
    
    // MARK: - Properties
    private let cKey: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var cButton: UIButton = {
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
    
    private let dKey: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var dButton: UIButton = {
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
    
    private let eKey: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var eButton: UIButton = {
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
    
    private let fKey: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var fButton: UIButton = {
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
    
    private let gKey: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var gButton: UIButton = {
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
    
    private let aKey: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var aButton: UIButton = {
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
    
    private let bKey: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var bButton: UIButton = {
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
        [self.cKey,
         self.dKey,
         self.eKey,
         self.fKey,
         self.gKey,
         self.aKey,
         self.bKey].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setSubviews() {
        addSubview(stackView)
        cKey.addSubview(cButton)
        dKey.addSubview(dButton)
        eKey.addSubview(eButton)
        fKey.addSubview(fButton)
        gKey.addSubview(gButton)
        aKey.addSubview(aButton)
        bKey.addSubview(bButton)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
        
        cButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
        }
        
        dButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
        
        eButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()
        }
        
        fButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview()
        }
        
        gButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
        
        aButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(35)
            make.trailing.equalToSuperview().inset(35)
            make.bottom.equalToSuperview()
        }
        
        bButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - Target Actions
private extension MainView {
    
    @objc func buttonPressed(_ button: UIButton) {
        delegate?.mainView(self, buttonPressed: button)
    }
}
