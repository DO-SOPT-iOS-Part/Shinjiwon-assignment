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
    
    let snowEmitter = CAEmitterLayer()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellStyle()
        hierarchy()
        layout()
        
        addSnowEffect()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 레이아웃 업데이트 시 Emitter Layer의 위치와 크기를 버튼의 경계에 맞춤
        snowEmitter.frame = listButton.bounds
        snowEmitter.emitterPosition = CGPoint(x: listButton.bounds.width / 2, y: 0)
        snowEmitter.emitterSize = CGSize(width: listButton.bounds.width, height: 1)
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
    
    private func addSnowEffect() {
        // Emitter Layer의 위치와 크기를 버튼의 크기에 맞게 설정
        snowEmitter.emitterPosition = CGPoint(x: listButton.bounds.width / 2, y: 0)
        snowEmitter.emitterShape = .line
        snowEmitter.emitterSize = CGSize(width: listButton.bounds.width, height: 1)
        snowEmitter.frame = listButton.bounds

        let snowflake = CAEmitterCell()
        snowflake.contents = UIImage.iconNavigation.cgImage
        snowflake.birthRate = 20
        snowflake.lifetime = Float(listButton.bounds.height / 50) // 버튼 높이에 맞춰 조정
        snowflake.velocity = 50 // 수직 속도, 필요에 따라 조정
        snowflake.velocityRange = 20
        snowflake.yAcceleration = 100
        snowflake.scale = 0.05
        snowflake.scaleRange = 0.02

        snowEmitter.emitterCells = [snowflake]
        listButton.layer.addSublayer(snowEmitter)
    }
}

extension ListTableViewCell {
    func dataBind(_ weather: Weathers){
        placeLabel.text = String(weather.name)
        timeLabel.text = convertTime(timezone: weather.timezone)
        weatherLabel.text = weather.weather.first?.description
        currentTemLabel.text = String(Int(weather.main.temp)) + "°"
        highTemLabel.text = "highest:" + String(Int(weather.main.temp_max)) + "°"
        lowTemLabel.text = "lowest:" + String(Int(weather.main.temp_min)) + "°"
    }
    
    func convertTime(timezone: Int) -> String {
        guard let timeZone = TimeZone(secondsFromGMT: timezone) else {
            return "Invalid Timezone"
        }
        
        let dateFormatter = DateFormatter()
        
        //24시간 기준 => HH
        //12시간 기준 => hh
        //AM, PM 표기 => a 위치
        
        dateFormatter.dateFormat = "a hh:mm"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.timeZone = timeZone
        let localTime = dateFormatter.string(from: Date())
        return localTime
    }
}
