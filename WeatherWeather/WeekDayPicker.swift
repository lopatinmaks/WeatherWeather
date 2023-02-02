//
//  WeekDayPicker.swift
//  WeatherWeather
//
//  Created by Ольга on 31.01.2023.
//

import UIKit

enum Day: Int, CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var title: String {
        switch self {
        case .monday:
            return "ПН"
        case .tuesday:
            return "ВТ"
        case .wednesday:
            return "СР"
        case .thursday:
            return "ЧТ"
        case .friday:
            return "ПТ"
        case .saturday:
            return "СБ"
        case .sunday:
            return "ВСК"
        }
    }
}

@IBDesignable final class WeekDayPicker: UIControl {
    
    private var selectedDay: Day? {
        didSet {
            upadteSelectedDay()
            sendActions(for: .valueChanged)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    private func setupView() {
        for day in Day.allCases {
            let button = UIButton(type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            
            button.addTarget(self, action: #selector(daySelected(_ :)), for: .touchUpInside)
            
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        
        addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    @objc private func daySelected(_ button: UIButton) {
        guard let index = buttons.firstIndex(of: button) else { return }
        guard let day = Day(rawValue: index) else { return }
        selectedDay = day
    }
    
    private func upadteSelectedDay() {
        for (index, button) in buttons.enumerated() {
            guard let day = Day(rawValue: index) else { continue }
            button.isSelected = day == selectedDay
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
}
