// -----------------------------------------------------------------------------
// File: LedNumbers.swift
// Package: DigitalClock
//
// Created by: ALLSWIFTUI on 16-09-20
// Copyright © 2020 allSwiftUI · https://allswiftui.com · @allswiftui
// -----------------------------------------------------------------------------

// MARK: - LedStates
/// Define the states for a led
enum LedStates {
    case on, off
}

// MARK: - Digit
/// Digit is a representation of a number (0 to 9) as array of states on/off called leds
struct Digit {
        
    var leds: [LedStates]
    
    // Initializes the led array with off state
    init(){
        self.leds = Array(repeating: .off, count: 7)
    }
    
    // Initializes the led array with on/off states for a number between 0 and 9
    // For any others numbers the led array is set to off state
    init(number: Int) {
        self.leds = Array(repeating: .off, count: 7)
        self.setDigit(to: number)
    }
    
    // Sets the led array with off state
    mutating func setOff() {
        self.leds = [.off,.off,.off,.off,.off,.off,.off]
    }
    
    // Sets the led array with a set of states on/off for a number
    mutating func setDigit(to number:Int) {
        switch number {
        case 0:
            self.leds = [.on,.on,.on,.off,.on,.on,.on]
        case 1:
            self.leds = [.off,.off,.on,.off,.off,.off,.on]
        case 2:
            self.leds = [.off,.on,.on,.on,.on,.on,.off]
        case 3:
            self.leds = [.off,.on,.on,.on,.off,.on,.on]
        case 4:
            self.leds = [.on,.off,.on,.on,.off,.off,.on]
        case 5:
            self.leds = [.on,.on,.off,.on,.off,.on,.on]
        case 6:
            self.leds = [.on,.on,.off,.on,.on,.on,.on]
        case 7:
            self.leds = [.off,.on,.on,.off,.off,.off,.on]
        case 8:
            self.leds = [.on,.on,.on,.on,.on,.on,.on]
        case 9:
            self.leds = [.on,.on,.on,.on,.off,.on,.on]
        default:
            setOff()
        }
    }
}
