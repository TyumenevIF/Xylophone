//
//  ViewController.swift
//  Xylophone
//
//  Created by Ilyas Tyumenev on 05.04.2023.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController {
    
    private let mainView = MainView()
    var player: AVAudioPlayer!

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        setSubviews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    private func setSubviews() {
        view.addSubview(mainView)
    }
    
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - MainViewDelegate
extension ViewController: MainViewDelegate {
    
    func mainView(_ view: MainView, buttonPressed button: UIButton) {
        playSound(soundName: button.currentTitle!)
        
        button.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.alpha = 1
        }
    }
}
