//
//  JZColumnHeader.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 28/3/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

/// Header for each column (section, day) in collectionView (Supplementary View)
open class JZColumnHeader: UICollectionReusableView {

    public var lblDay = UILabel()
    public var lblWeekday = UILabel()
    public var lblPoint = UIView()
    let calendarCurrent = Calendar.current
    public var dateFormatter = DateFormatter()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        backgroundColor = .clear
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setupUI() {
        // Hide all content when colum header height equals 0
        self.clipsToBounds = true
        let stackView = UIStackView(arrangedSubviews: [lblDay, lblWeekday])
        stackView.axis = .vertical
        stackView.spacing = 2
        addSubview(stackView)
        stackView.setAnchorConstraintsEqualTo(centerXAnchor: centerXAnchor, centerYAnchor: centerYAnchor)
        lblDay.textAlignment = .center
        lblWeekday.textAlignment = .center
        lblDay.font = UIFont.init(name: "DINAlternate-Bold", size: 24)
        lblWeekday.font = UIFont.systemFont(ofSize: 13)
        
        lblPoint.backgroundColor = .gray
        lblPoint.layer.cornerRadius = 3
        addSubview(lblPoint)
        let left = (UIScreen.main.bounds.width - 70) / 3
        lblPoint.setAnchorConstraintsEqualTo(widthAnchor: 6, heightAnchor: 6, bottomAnchor: (bottomAnchor, -5), leadingAnchor: (leadingAnchor, left * 0.5 - 3))
        
        
    }

    public func updateView(date: Date) {
        let weekday = calendarCurrent.component(.weekday, from: date) - 1

        lblDay.text = String(calendarCurrent.component(.day, from: date))
        lblWeekday.text = dateFormatter.shortWeekdaySymbols[weekday].uppercased()

        if date.isToday {
            lblDay.textColor = JZWeekViewColors.today
            lblWeekday.textColor = JZWeekViewColors.today
        } else {
            lblDay.textColor = JZWeekViewColors.columnHeaderDay
            lblWeekday.textColor = JZWeekViewColors.columnHeaderDay
        }
    }

}
