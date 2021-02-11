//
//  EmpListVC.swift
//  MyEmployee-VIPER
//
//  Created by Sachin Sabat on 08/02/21.
//

import UIKit

final class EmpListVC: UIViewController {
    
    var presenter: EmployeeListViewOutput!
    
    var viewState: ViewState = .none
    var empListViewModel: EmpListViewModel?
    
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let spacing = Constants.defaultSpacing
        let itemWidth: CGFloat = UIScreen.main.bounds.width
        let itemHeight: CGFloat = Constants.employeeListHeight
        print(itemHeight)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .appBackground()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    //MARK: ViewController Lifecycle
    override func loadView() {
        view = UIView()
        view.backgroundColor = .appBackground()
        navigationItem.title = Strings.empListDBTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter.getEmpList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        scrollViewDidScroll(collectionView) // to set nav bar color
    }
    
    private func setupViews() {
        configureCollectionView()
    }
    
    //MARK: ConfigureCollectionView
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.pinEdgesToSuperview()
        collectionView.registerCell(GenericCollectionViewCell<EmployeeListCardView>.self)
        collectionView.register(FooterView.self, ofKind: UICollectionView.elementKindSectionFooter)
    }
    
}

//MARK: EmployeeListViewInput

extension EmpListVC: EmployeeListViewInput {
    
    func reloadCell(at index: Int, viewModel: EmpListViewModel) {
        empListViewModel = viewModel
        DispatchQueue.main.async {
            self.collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
        }
    }
    
    func makeEmployee(_ favourite: Bool, at item: Int) {
        empListViewModel?.employees[item].isFavourite = favourite
    }

    
    func changeViewState(_ state: ViewState) {
        viewState = state
        switch state {
        case .loading:
            if empListViewModel == nil {
                showSpinner()
            }
        case .content:
            hideSpinner()
            collectionView.collectionViewLayout.invalidateLayout()
        case .error(let message):
            hideSpinner()
            showAlert(title: Strings.error, message: message, retryAction: { [unowned self] in
                self.presenter.getEmpList()
            })
        default:
            break
        }
    }
    
    func displayEmployees(with viewModel: EmpListViewModel) {
        empListViewModel = viewModel
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}
//MARK: CollectionView DataSource

extension EmpListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = empListViewModel, !viewModel.isEmpty else {
            return 0
        }
        return viewModel.employeesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as GenericCollectionViewCell<EmployeeListCardView>
        
        guard let viewModel = empListViewModel else {
            return cell
        }
        
        guard cell.cellView != nil else {
            let cardView = EmployeeListCardView(frame: .zero)
            cell.cellView = cardView
            cell.cellView?.employee = viewModel.employeeAt(indexPath.item)
            cell.cellView?.favouriteButton.tag = indexPath.item
            cell.cellView?.favouriteButton.addTarget(self, action: #selector(userDidTapOnFavourite), for: .touchUpInside)
            return cell
        }
        
        cell.cellView?.favouriteButton.tag = indexPath.item
        cell.cellView?.employee = empListViewModel?.employeeAt(indexPath.item)
        
        return cell
    }
    
    @objc func userDidTapOnFavourite(sender: UIButton) {
        presenter.userDidTapOnFavourite(at: sender.tag)
    }
    
}

//MARK: UICollectionViewDelegateFlowLayout

extension EmpListVC: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        guard offSetY != 0 else {
            setNavbarTransculent()
            return
        }
        let denominator: CGFloat = 50 //your offset treshold
        let alpha = min(1, offSetY / denominator)
        setNavbar(backgroundColorAlpha: alpha)
    }
    
    // To send the selected data to presenter
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectEmployee(at: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let viewModel = empListViewModel else { return }
        guard viewState != .loading, indexPath.row == (viewModel.employeesCount - 1) else {
            return
        }
   
    }
    
    //MARK: UICollectionViewFooter
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if viewState == .loading && empListViewModel != nil {
            return CGSize(width: Constants.screenWidth, height: 50)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath) as FooterView
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
        return UICollectionReusableView()
    }
}


