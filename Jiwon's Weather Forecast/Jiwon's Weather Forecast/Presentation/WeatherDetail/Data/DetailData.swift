//
//  DetailData.swift
//  Jiwon's Weather Forecast
//
//  Created by 신지원 on 10/18/23.
//

import UIKit

let detailLiveData =
[Detail(time: "Now", icon: .lightning, tem: "21"),
 Detail(time: "10시", icon: .lightning, tem: "23"),
 Detail(time: "11시", icon: .rain, tem: "19"),
 Detail(time: "12시", icon: .rainsun, tem: "15"),
 Detail(time: "1시", icon: .snow, tem: "13"),
 Detail(time: "2시", icon: .moon, tem: "16"),
 Detail(time: "3시", icon: .lightning, tem: "8"),
 Detail(time: "4시", icon: .moon, tem: "10"),
 Detail(time: "5시", icon: .moon, tem: "22"),
 Detail(time: "6시", icon: .lightning, tem: "20")]

let detailWeekData =
[Detail2(day: "오늘", icon: .lightning, lowTem: 15, highTem: 29),
 Detail2(day: "월", icon: .rain, lowTem: 18, highTem: 27),
 Detail2(day: "화", icon: .rainsun, lowTem: 20, highTem: 25),
 Detail2(day: "수", icon: .lightning, lowTem: 17, highTem: 25),
 Detail2(day: "목", icon: .rain, lowTem: 17, highTem: 25),
 Detail2(day: "금", icon: .rain, lowTem: 17, highTem: 25),
 Detail2(day: "토", icon: .rainsun, lowTem: 20, highTem: 28),
 Detail2(day: "일", icon: .lightning, lowTem: 18, highTem: 26),
 Detail2(day: "월", icon: .rainsun, lowTem: 12, highTem: 19),
 Detail2(day: "화", icon: .lightning, lowTem: 13, highTem: 23)]

let detailWeekDataNum = detailWeekData.count
var detailWeekDataMax = 0
var detailWeekDataMin = 100

func findMaxMin() {
    for i in 0...detailWeekDataNum-1 {
        var low = detailWeekData[i].lowTem
        var high = detailWeekData[i].highTem
        
        if(low < detailWeekDataMin){
            detailWeekDataMin = low
        }
        
        if(high < detailWeekDataMin){
            detailWeekDataMin = high
        }
        
        if(low > detailWeekDataMax){
            detailWeekDataMax = low
        }
        
        if(high > detailWeekDataMax){
            detailWeekDataMax = high
        }
    }
}
