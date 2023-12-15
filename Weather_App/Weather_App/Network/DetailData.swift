//
//  DetailData.swift
//  Weather_App
//
//  Created by 신지원 on 12/12/23.
//

import UIKit

let detailLiveData =
[Detail(time: "Now", icon: .lightning, tem: "21"),
 Detail(time: "10", icon: .lightning, tem: "23"),
 Detail(time: "11", icon: .rain, tem: "19"),
 Detail(time: "12", icon: .rainsun, tem: "15"),
 Detail(time: "13", icon: .snow, tem: "13"),
 Detail(time: "14", icon: .moon, tem: "16"),
 Detail(time: "15", icon: .lightning, tem: "8"),
 Detail(time: "16", icon: .moon, tem: "10"),
 Detail(time: "17", icon: .moon, tem: "22"),
 Detail(time: "18", icon: .lightning, tem: "20")]

let detailWeekData =
[Detail2(day: "Today", icon: .lightning, lowTem: 15, highTem: 29),
 Detail2(day: "Mon", icon: .rain, lowTem: 18, highTem: 27),
 Detail2(day: "Tue", icon: .rainsun, lowTem: 20, highTem: 25),
 Detail2(day: "Wed", icon: .lightning, lowTem: 17, highTem: 25),
 Detail2(day: "Thu", icon: .rain, lowTem: 17, highTem: 25),
 Detail2(day: "Fri", icon: .rain, lowTem: 17, highTem: 25),
 Detail2(day: "Sat", icon: .rainsun, lowTem: 20, highTem: 28),
 Detail2(day: "Sun", icon: .lightning, lowTem: 18, highTem: 26),
 Detail2(day: "Mon", icon: .rainsun, lowTem: 12, highTem: 19),
 Detail2(day: "Tue", icon: .lightning, lowTem: 13, highTem: 23)]

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
