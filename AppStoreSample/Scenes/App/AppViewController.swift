//
//  AppViewController.swift
//  AppStoreSample
//
//  Created by kmjmarine on 2022/01/23.
//

import UIKit
import SnapKit

final class AppViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(100.0)
        }
        
        [featureSectionView, rankingFeatureSectionView, exchangeCodeButtonView, spacingView].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController()
        setUpLayout()
    }
}

private extension AppViewController {
    func setNavigationController() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            
            scrollView.addSubview(contentView)
            contentView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalToSuperview()
            }
            
            contentView.addSubview(stackView)
            stackView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }
}
