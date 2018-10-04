//
//  DetailCotroller.swift
//  Search
//
//  Created by Mac on 10/3/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import AVKit

final class DetailController: BaseController{
    
    private let playerController : AVPlayerViewController = {
       return AVPlayerViewController()
    }()
    
    let imageView: UIImageView = {
        let iv = BorderedImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lbl = TitleLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let subtitleLabel: UILabel = {
        let lbl = SubTitleLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let viewOnStoreBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle(Constants.Strings.viewOnStore, for: .normal)
        btn.setTitleColor(UIColor.itunesBlue, for: .normal)
        btn.titleLabel?.font = UIFont.SUB_TITLE_FONT
        btn.tag = 0
        return btn
    }()
    
    let playPreviewButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.itunesBlue, for: .normal)
        btn.setTitle(Constants.Strings.playPreview, for: .normal)
        btn.tag = 1
        btn.titleLabel?.font = UIFont.SUB_TITLE_FONT
        return btn
    }()
    
    
    
    private var media: Media
    
    init(media: Media) {
        self.media = media
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(imageView)
        
        imageView.anchor(leading: view.safeLeading, trailing: nil, top: view.safeTop, bottom: nil, padding: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
        imageView.setSize(with: CGSize(width: 100, height: 100))
        
        view.addSubview(titleLabel)
        
        titleLabel.anchor(leading: imageView.leadingAnchor, trailing: view.safeTrailing, top: imageView.bottomAnchor, bottom: nil, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 8) )
        
        view.addSubview(subtitleLabel)
        
        subtitleLabel.anchor(leading: titleLabel.leadingAnchor, trailing: titleLabel.trailingAnchor, top: titleLabel.bottomAnchor, bottom: nil, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
        
        
        
        updateData()
        
        
    }
    
    private func updateData(){
        
        title = Constants.Strings.titleDetailsController
        
        imageView.sd_setImage(with: URL(string: media.imageURL ?? ""), placeholderImage: UIImage(named: "itunes-logo-2809"), options: .refreshCached, completed: nil)
        
        titleLabel.text = media.title
        subtitleLabel.text = media.subTitle
        
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        
        if let itunesLink = media.itunesLink{
            print(itunesLink)
            stackView.addArrangedSubview(viewOnStoreBtn)
        }
        
        if let _ = media.previewURL {
            stackView.addArrangedSubview(playPreviewButton)
        }
        
        stackView.anchor(leading: imageView.leadingAnchor, trailing: nil, top: subtitleLabel.bottomAnchor, bottom: nil, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0))
        
        viewOnStoreBtn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        playPreviewButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        
        
    }
    
//    let player = AVPlayer(url: videoURL)
//    let vc = AVPlayerViewController()
//    vc.player = player
//
//    present(vc, animated: true) {
//    vc.player?.play()
//    }
    
    
    @objc
    private func buttonTapped(_ sender: UIButton){
        if let itunesLink = media.itunesLink, sender.tag == 0, let url = URL(string: itunesLink), UIApplication.shared.canOpenURL(url) {
            // go to itunes store
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            print("itunes store")
            
        }
        
        if let previewLink = media.previewURL, sender.tag == 1, let url = URL(string: previewLink) {
            let player = AVPlayer(url: url)
            playerController.player = player
            present(playerController, animated: true) {
                self.playerController.player?.play()
            }
        }
        
    }
    
    
    
    
    
}
