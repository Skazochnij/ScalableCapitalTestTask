//
//  RepositoryTableViewCell.swift
//  SCTestTask
//
//  Created by Aleksey Kornienko on 20/05/2018.
//  Copyright © 2018 Aleksey Kornienko. All rights reserved.
//

import UIKit

protocol RepositoryCellProtocol {
    var viewModel: RepositoryCellViewModelProtocol? { get set }
}

protocol RepositoryCommitsProtocol {
    func commitsDidLoad()
}

class RepositoryTableViewCell: UITableViewCell, NibLoadable, ViewReusable, RepositoryCellProtocol {
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var lastCommit: UILabel!
    @IBOutlet weak var repoDescription: UILinedTextView!
    
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var forkedView: UIView!
    @IBOutlet weak var licenseView: UIView!
    @IBOutlet weak var updatedView: UIView!
    
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var forks: UILabel!
    @IBOutlet weak var license: UILabel!
    @IBOutlet weak var updated: UILabel!
    
    var viewModel: RepositoryCellViewModelProtocol? {
        didSet {
            viewModel?.commitsDelegate = self
            
            repoName.text = viewModel?.name
            repoDescription.text = viewModel?.description
            
            let languageText = viewModel?.language
            language.text = languageText
            languageView.isHidden = languageText == nil
            
            let forksText = viewModel?.forks
            forks.text = forksText
            forkedView.isHidden = forksText == nil
            
            let licenceText = viewModel?.license
            license.text = licenceText
            licenseView.isHidden = licenceText == nil
            
            let updatedText = viewModel?.updated
            updated.text = updatedText
            updatedView.isHidden = updatedText == nil
        }
    }
}

extension RepositoryTableViewCell: RepositoryCommitsProtocol {
    func commitsDidLoad() {
        if let entity = viewModel?.commits.first {
            lastCommit.text = "Last commit: \(entity.commit.message)" //TODO NSLocalizableString
        } else {
            lastCommit.text = "Last commit: no message"
        }
        layoutIfNeeded()
    }
}
