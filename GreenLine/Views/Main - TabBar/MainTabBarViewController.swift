//
//  MainTabBarViewController.swift
//  GreenLine
//
//  Created by BrainX Technologies IOS 4 on 03/08/2022.
//

import UIKit

enum MainTab {
    case schedule
    case mySchedule
    case timeClock
    case more
}

class MainTabBarViewController: BaseViewController {

    @IBOutlet var tabsView: MainTabBarView!
    
    var selectedTab: MainTab = .schedule
    
    private lazy var scheduleViewController: ScheduleViewController = {
        let vc = ScheduleViewController.instantiate(from: .Main)
        return vc
    }()
    private lazy var myScheduleViewController: MyScheduleViewController = {
        let vc = MyScheduleViewController.instantiate(from: .Main)
        return vc
    }()
    private lazy var timeClockViewController: ShiftsViewController = {
        let vc = ShiftsViewController.instantiate(from: .Main)
        return vc
    }()
    private lazy var moreViewController: MoreViewController = {
        let vc = MoreViewController.instantiate(from: .Main)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setSelectedTab(selectedTab)
    }
    
    // MARK: - Internal Methods
    
    func setSelectedTab(_ tab: MainTab){
        remove(asChildViewController: controllerForTab(selectedTab))
        tabsView.setActiveView(newTab: tab, oldTab: selectedTab)
        selectedTab = tab
        add(asChildViewController: controllerForTab(tab))
    }
    
    // MARK: - Private Methods
    
    private func add(asChildViewController viewController: UIViewController){
        let containerView = tabsView.tabsContainerView!
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addChild(viewController)
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController){
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func controllerForTab(_ tab: MainTab) -> UIViewController {
        switch tab {
        case .schedule: return scheduleViewController
        case .mySchedule: return myScheduleViewController
        case .timeClock: return timeClockViewController
        case .more: return moreViewController
        }
    }
    
    @IBAction
    func selectTabButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0: setSelectedTab(.schedule)
        case 1: setSelectedTab(.mySchedule)
        case 2: setSelectedTab(.timeClock)
        case 3: setSelectedTab(.more)
        default: setSelectedTab(.schedule)
        }
    }
}
