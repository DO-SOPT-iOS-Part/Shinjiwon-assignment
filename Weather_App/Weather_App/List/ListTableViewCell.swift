//
//  ListTableViewCell.swift
//  Weather_App
//
//  Created by 신지원 on 12/11/23.
//

import UIKit

import SnapKit
import Then

protocol ListTableViewCellDelegate : AnyObject {
    func listBtnTap(_ cell: UITableViewCell)
}

class ListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "ListTableViewCell"
    weak var delegate: ListTableViewCellDelegate?
    
    // MARK: - UI Components
    
    var listButton = UIButton()
    var placeLabel = UILabel()
    var timeLabel = UILabel()
    var weatherLabel = UILabel()
    var currentTemLabel = UILabel()
    var highTemLabel = UILabel()
    var lowTemLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellStyle()
        hierarchy()
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func cellStyle() {
        
        self.backgroundColor = .black
        self.selectedBackgroundView?.isHidden = true
        self.contentView.isHidden = true
        
        listButton.do {
            $0.setBackgroundImage(Image.weatherSmall, for: .normal)
            $0.addTarget(self, action: #selector(listBtnTap), for: .touchUpInside)
        }
        
        placeLabel.do {
            $0.font = .SFPro(.bold, size: 24)
            $0.textColor = .white
        }
        
        timeLabel.do {
            $0.font = .SFPro(.regular, size: 17)
            $0.textColor = .white
        }
        
        weatherLabel.do {
            $0.font = .SFPro(.regular, size: 16)
            $0.textColor = .white
        }
        
        currentTemLabel.do {
            $0.font = .SFPro(.regular, size: 52)
            $0.textColor = .white
        }
        highTemLabel.do {
            $0.font = .SFPro(.regular, size: 15)
            $0.textColor = .white
        }
        
        lowTemLabel.do {
            $0.font = .SFPro(.regular, size: 15)
            $0.textColor = .white
        }
    }
    
    func hierarchy() {
        self.addSubview(listButton)
        listButton.addSubviews(placeLabel, timeLabel, weatherLabel, currentTemLabel, lowTemLabel, highTemLabel)
    }
    
    func layout() {
        listButton.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        placeLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        timeLabel.snp.makeConstraints() {
            $0.top.equalTo(placeLabel.snp.bottom).offset(2)
            $0.leading.equalTo(placeLabel.snp.leading)
        }
        
        weatherLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(placeLabel.snp.leading)
        }
        
        currentTemLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        lowTemLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        highTemLabel.snp.makeConstraints() {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(lowTemLabel.snp.leading).offset(-6)
        }
    }
    
    @objc
    private func listBtnTap() {
        delegate?.listBtnTap(self)
    }
}
