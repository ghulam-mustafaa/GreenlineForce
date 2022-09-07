//
//  CalendarView.swift
//  Tespo Health
//
//  Created by BrainX Technologies 11 on 24/03/2021.
//  Copyright © 2021 BrainX Technologies. All rights reserved.
//

import UIKit

protocol CalendarViewDelegate {
    func calendarView(_ calendarView: CalendarView, didSelectDate date: Date)
    func calendarView(_ calendarView: CalendarView, didChangeMonth date: Date)
}

//protocol CalendarViewDataSource {
//    func calendarView(_ calendarView: CalendarView, jobCountOfDate date: Date) -> MonthJobCountModel?
//}

class CalendarView: UIView {
    // MARK: - Instance Properties

    private let weekdays: [String] = [
        "M",
        "T",
        "W",
        "T",
        "F",
        "S",
        "S",
    ]
    private var dates = [Date]()
    private var contentSizeKeyPath = "contentSize"
    private let numberOfDaysToShow = 7
    private let monthLabelFormat = "MMMM yyyy"
    var delegate: CalendarViewDelegate? {
        didSet {
            delegate?.calendarView(self, didChangeMonth: selectedMonth)
        }
    }
//    var dataSource: CalendarViewDataSource?
    
    var selectedIndex: Int?
    var selectedMonth = Date().startOfMonth ?? Date() {
        didSet {
            reloadData()
        }
    }
    

    // MARK: - Outlets

    @IBOutlet var calendarCollectionView: UICollectionView!
    
    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: - Override Methods

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // MARK: - Override Methods

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change _: [NSKeyValueChangeKey: Any]?, context _: UnsafeMutableRawPointer?) {
        if let obj = object as? UICollectionView,
           obj == calendarCollectionView,
           keyPath == contentSizeKeyPath {
            invalidateIntrinsicContentSize()
            layoutIfNeeded()
        }
    }

    // MARK: - Public Methods

    func reloadData() {
        dates.removeAll()
        setupDates()
        selectDateForSelectedMonth()
        calendarCollectionView.reloadData()
        if let index = selectedIndex, isDateInSelectedMonth(dates[index]) {
            delegate?.calendarView(self, didSelectDate: dates[index])
        }
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .right:
                updateMonth(withOffset: -1)
            case .down:
                print("Swiped down")
            case .left:
                updateMonth(withOffset: 1)
            case .up:
                print("Swiped up")
            default:
                break
            }
        }
    }
}

// MARK: - Private Methods

private extension CalendarView {
    // MARK: Initial Setup

    private func commonInit() {
        guard let contentView = loadFromNib() else {
            return
        }
        addSubview(contentView)
        contentView.fixInView(self)
        configureViewsOnLoad()
        setupDates()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        calendarCollectionView.addGestureRecognizer(swipeRight)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .left
        calendarCollectionView.addGestureRecognizer(swipeDown)
        calendarCollectionView.addObserver(self, forKeyPath: contentSizeKeyPath, options: .new, context: nil)
        delegate?.calendarView(self, didChangeMonth: selectedMonth)
    }

    private func configureViewsOnLoad() {
        calendarCollectionView.register(DayCollectionViewCell.self, forCellWithReuseIdentifier: DayCollectionViewCell.reuseIdentifier)
        calendarCollectionView.register(UINib(nibName: DateCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: DateCollectionViewCell.reuseIdentifier)
        calendarCollectionView.dataSource = self
        calendarCollectionView.delegate = self
    }

    // MARK: Helpers

    private func sizeForItemAtIndexPath(_ indexPath: IndexPath) -> CGSize {
        layoutIfNeeded()
        let width = calendarCollectionView.bounds.width
        let totalSpacing: CGFloat = 16
        let itemWidth = (width - totalSpacing) / CGFloat(numberOfDaysToShow)
        let itemHeight: CGFloat = indexPath.item > 6 ? (calendarCollectionView.frame.height / 6) : (calendarCollectionView.frame.height / 5)
        return CGSize(width: itemWidth, height: itemHeight)
    }

    private func setupDates() {
        dates.removeAll()
        let startDate = selectedMonth.firstDayOfWeek()
        let endDate = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: selectedMonth)?.lastDayOfWeek ?? Date()
        let month = selectedMonth.formatDate(toFormat: monthLabelFormat)
        dates = Date.dates(from: startDate, to: endDate)
    }

    private func isDateInSelectedMonth(_ date: Date) -> Bool {
        return Calendar.current.isDate(date, equalTo: selectedMonth, toGranularity: .month)
    }

    private func selectDateForSelectedMonth() {
        guard selectedIndex != nil else {
            return
        }
        if isDateInSelectedMonth(Date()) {
            let index = dates.firstIndex(where: { Calendar.current.isDateInToday($0) })
            selectedIndex = index
        } else {
            let index = dates.firstIndex(where: { Calendar.current.isDate($0, inSameDayAs: selectedMonth) })
            selectedIndex = index
        }
    }

    private func updateMonth(withOffset offset: Int) {
        let date = Calendar.current.date(byAdding: DateComponents(month: offset), to: selectedMonth) ?? Date()
        selectedMonth = date
        delegate?.calendarView(self, didChangeMonth: date)
    }

    // MARK: Actions

    @IBAction
    func rightArrowTapped(_: Any) {
        updateMonth(withOffset: 1)
    }

    @IBAction
    func leftArrowTapped(_: Any) {
        updateMonth(withOffset: -1)
    }
}

// MARK: - CollectionView Data Source

extension CalendarView: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        dates.count + numberOfDaysToShow
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.item > 6 else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.reuseIdentifier, for: indexPath) as! DayCollectionViewCell
            cell.setDay(weekdays[indexPath.item % numberOfDaysToShow])
            return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCollectionViewCell.reuseIdentifier, for: indexPath) as! DateCollectionViewCell
        let date = dates[indexPath.item - numberOfDaysToShow]
        let day = Calendar.current.component(.day, from: date)
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.weekday], from: date)
        let shouldNotHighlight = !isDateInSelectedMonth(date)
        var showMarker = false
        if let selectedIndex = selectedIndex {
            showMarker = selectedIndex + numberOfDaysToShow == indexPath.row
        } else {
            let date = dates[indexPath.item - numberOfDaysToShow]
            if Calendar.current.isDateInToday(date) {
                showMarker = true
            }
        }
        cell.setDate(String(day),
                     shouldNotHighlight: shouldNotHighlight,
                     showMarker: showMarker)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item > 6, indexPath.item < dates.count + numberOfDaysToShow else {
            return
        }
        let date = dates[indexPath.item - numberOfDaysToShow]
        guard isDateInSelectedMonth(date) else {
            return
        }
        selectedIndex = indexPath.item - numberOfDaysToShow
        collectionView.reloadData()
        delegate?.calendarView(self, didSelectDate: dates[indexPath.item - numberOfDaysToShow])
    }
}

// MARK: - CollectionView Delegate Flow Layout

extension CalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return .zero
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 0
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForItemAtIndexPath(indexPath)
    }
}
