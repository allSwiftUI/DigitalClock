// -----------------------------------------------------------------------------
// File: ContentView.swift
// Package: DigitalClock
//
// Created by: ALLSWIFTUI on 15-09-20
// Copyright © 2020 allSwiftUI · https://allswiftui.com · @allswiftui
// -----------------------------------------------------------------------------

import SwiftUI

// MARK: - Digital Clock display layout with
/// Two digits for display the hours
/// Two digits for display the minutes
/// Two digits for display the seconds
struct ContentView: View {
     
    @State private var digitHourOne: Digit = Digit()
    @State private var digitHourTwo: Digit = Digit()
    @State private var digitMinuteOne: Digit = Digit()
    @State private var digitMinuteTwo: Digit = Digit()
    @State private var digitSecondOne: Digit = Digit()
    @State private var digitSecondTwo: Digit = Digit()
    
    @State var tick: Bool = false
    
    let ledOn: CGColor = CGColor(red: 0.20, green: 0.78, blue: 0, alpha: 1)
    let ledOff: CGColor = CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    
    @State var currentDate: Time = Time(date: Date())
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                DisplayDigit(digit: digitHourOne)
                DisplayDigit(digit: digitHourTwo)
                
                VStack {
                    RoundedRectangle(cornerRadius: 4.0)
                        .fill(Color((tick == false) ? ledOff:ledOn))
                        .frame(width: 14, height: 14, alignment: .center)
                    
                    RoundedRectangle(cornerRadius: 4.0)
                        .fill(Color((tick == false) ? ledOff:ledOn))
                        .frame(width: 14, height: 14, alignment: .center)
                }
                
                DisplayDigit(digit: digitMinuteOne)
                DisplayDigit(digit: digitMinuteTwo)
            }
            HStack {
                DisplayDigit(digit: digitSecondOne)
                DisplayDigit(digit:digitSecondTwo)
            }
        }
        .onReceive(timer, perform: { currentTimeDate in
            tick.toggle()
            currentDate = Time(date: currentTimeDate)
            // Hours
            if currentDate.hours < 10 {
                digitHourOne.setDigit(to: 0)
                digitHourTwo.setDigit(to: currentDate.hours.array[0])
            }else{
                digitHourOne.setDigit(to: currentDate.hours.array[0])
                digitHourTwo.setDigit(to: currentDate.hours.array[1])
            }
            // Minutes
            if currentDate.minutes < 10 {
                digitMinuteOne.setDigit(to: 0)
                digitMinuteTwo.setDigit(to: currentDate.minutes.array[0])
            }else{
                digitMinuteOne.setDigit(to: currentDate.minutes.array[0])
                digitMinuteTwo.setDigit(to: currentDate.minutes.array[1])
            }
            // Seconds
            if currentDate.seconds < 10 {
                digitSecondOne.setOff()
                digitSecondTwo.setDigit(to: currentDate.seconds.array[0])
            }else{
                digitSecondOne.setDigit(to: currentDate.seconds.array[0])
                digitSecondTwo.setDigit(to: currentDate.seconds.array[1])
            }
        })
    }
}

// MARK: - Number to Digits
/// We extend Int to transform a number into an array of digits
extension Int {
    var array: [Int] {
        return String(self).compactMap{ Int(String($0)) }
    }
}

// MARK: - Time in hours, minutes and seconds
/// We manipulate the current date for get the hours, minutes and seconds
struct Time {
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    init(date: Date) {
        hours = Calendar.current.component(.hour, from: date)
        minutes = Calendar.current.component(.minute, from: date)
        seconds = Calendar.current.component(.second, from: date)
    }
    
    mutating func setTime(date: Date) {
        hours = Calendar.current.component(.hour, from: date)
        minutes = Calendar.current.component(.minute, from: date)
        seconds = Calendar.current.component(.second, from: date)
    }
}

// MARK: - ContentView Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
