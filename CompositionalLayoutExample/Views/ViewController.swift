//
//  ViewController.swift
//  CompositionalLayoutExample
//
//  Created by Doan Thieu on 07/07/2022.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createCollectionViewLayout()
        )

        collectionView.backgroundColor = .clear

        return collectionView
    }()

    let viewModel: ViewModel
    private lazy var dataSource = DataSource(collectionView: collectionView)
    private let disposeBag = DisposeBag()

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        bindViewModel()
    }
}

extension ViewController {

    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout(
            sectionProvider: { [weak self] sectionIndex, _ in
                guard let sectionKind = SectionLayoutKind(rawValue: sectionIndex) else {
                    fatalError()
                }

                switch sectionKind {
                case .list1:
                    return self?.createVerticalListLayout(estimatedHeight: 150)
                case .featured:
                    return self?.createHorizontalListLayout(hasSectionHeader: true)
                default:
                    return self?.createVerticalListLayout(estimatedHeight: 52, hasSectionHeader: true)
                }
            }
        )
    }

    private func createVerticalListLayout(estimatedHeight: CGFloat, hasSectionHeader: Bool = false) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(estimatedHeight)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)

        if hasSectionHeader {
            let sectionHeader = createSectionHeader()
            section.boundarySupplementaryItems = [sectionHeader]
        }

        return section
    }

    private func createHorizontalListLayout(hasSectionHeader: Bool = false) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/2)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalWidth(1/3)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )

        group.contentInsets = NSDirectionalEdgeInsets(
            top: 8,
            leading: 16,
            bottom: 8,
            trailing: 8
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        if hasSectionHeader {
            let sectionHeader = createSectionHeader()
            section.boundarySupplementaryItems = [sectionHeader]
        }

        return section
    }

    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )

        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }

    private func setupViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My Wallet"

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        collectionView.register(CollectionSectionHeaderView.self, sectionKind: UICollectionView.elementKindSectionHeader)
        collectionView.register(TotalBalanceCollectionViewCell.self)
        collectionView.register(AssetCollectionViewCell.self)
        collectionView.register(TransactionCollectionViewCell.self)
        collectionView.register(RatedCoinCollectionViewCell.self)
    }
}

extension ViewController {

    private func bindViewModel() {
        let input = ViewModelInput()
        let output = viewModel.transform(input: input)

        output.items
            .map(\.snapshot)
            .drive(dataSource.rx.snapshot)
            .disposed(by: disposeBag)
    }
}
