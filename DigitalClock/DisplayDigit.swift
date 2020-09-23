// -----------------------------------------------------------------------------
// File: DigitsViewModel.swift
// Package: DigitalClock
//
// Created by: ALLSWIFTUI on 16-09-20
// Copyright © 2020 allSwiftUI · https://allswiftui.com · @allswiftui
// -----------------------------------------------------------------------------

import SwiftUI

// MARK: - Display a Digit
/// Display a digit as array of shapes called leds
/// The color of fill set the state of a led (ledOn/ledOff)
///
///              Top
///              ----
///     TopLeft ||  || TopRight
///             ||  ||
///      Middle  ----
///             ||  ||
///  BottomLeft ||  || BottomRight
///              ----
///             Bottom
///
struct DisplayDigit: View {
    
    var digit: Digit
    
    let ledOn: CGColor = CGColor(red: 0.20, green: 0.78, blue: 0, alpha: 1)
    let ledOff: CGColor = CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    
    var body: some View {
        ZStack(alignment: .center) {
            // TopLeft led position 0
            VLed()
                .fill(Color(digit.leds[0] == .on ? ledOn:ledOff))
                .frame(width: 14, height: 44, alignment: .center)
                .alignmentGuide(VerticalAlignment.center, computeValue: { _ in 45})
                .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 27})
            
            // Top led position 1
            HLed()
                .fill(Color(digit.leds[1] == .on ? ledOn:ledOff))
                .frame(width: 50, height: 14, alignment: .center)
                .alignmentGuide(VerticalAlignment.center, computeValue: { _ in 46})
            
            // TopRight led position 2
            VLed()
                .fill(Color(digit.leds[2] == .on ? ledOn:ledOff))
                .frame(width: 14, height: 44, alignment: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                .alignmentGuide(VerticalAlignment.center, computeValue: { _ in 45})
                .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in -13})
            
            // Middle led position 3
            MLed()
                .fill(Color(digit.leds[3] == .on ? ledOn:ledOff))
                .frame(width: 40, height: 16, alignment: .center)
            
            // BottomLeft led position 4
            VLed()
                .fill(Color(digit.leds[4] == .on ? ledOn:ledOff))
                .frame(width: 14, height: 44, alignment: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 1.0, y: 0.0, z: 0.0))
                .alignmentGuide(VerticalAlignment.center, computeValue: { _ in -1})
                .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in 27})
            
            // Bottom led position 5
            HLed()
                .fill(Color(digit.leds[5] == .on ? ledOn:ledOff))
                .frame(width: 50, height: 14, alignment: .center)
                .rotationEffect(.degrees(180))
                .alignmentGuide(VerticalAlignment.center, computeValue: { _ in -32})
            
            // BottomRight Led position 6
            VLed()
                .fill(Color(digit.leds[6] == .on ? ledOn:ledOff))
                .frame(width: 14, height: 44, alignment: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                .rotation3DEffect(.degrees(180), axis: (x: 1.0, y: 0.0, z: 0.0))
                .alignmentGuide(VerticalAlignment.center, computeValue: { _ in -1})
                .alignmentGuide(HorizontalAlignment.center, computeValue: { _ in -13})
        }
        .padding(5.0)
        
    }
}

// MARK: - HLed
/// Draw a horizontal shape called HLed
struct HLed: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: .zero)
        p.addLines([CGPoint(x: 0, y: 0), CGPoint(x: 50, y: 0),
                    CGPoint(x: 50, y: 0), CGPoint(x: 36, y: 14),
                    CGPoint(x: 36, y: 14), CGPoint(x: 14, y: 14),
                    CGPoint(x: 14, y: 14), CGPoint(x: 0, y: 0)])
        
        return p
    }
}

// MARK: - MLed
/// Draw a horizontal shape called MLed
struct MLed: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: 0, y: 8))
        p.addLines([CGPoint(x: 0, y: 8), CGPoint(x: 9, y: 16),
                    CGPoint(x: 9, y: 16), CGPoint(x: 31, y: 16),
                    CGPoint(x: 31, y: 16), CGPoint(x: 40, y: 8),
                    CGPoint(x: 40, y: 8), CGPoint(x: 31, y: 0),
                    CGPoint(x: 31, y: 0), CGPoint(x: 9, y: 0),
                    CGPoint(x: 9, y: 0), CGPoint(x: 0, y: 8)])
        
        return p
    }
}

// MARK: - VLed
/// Draw a vertical shape called VLed
struct VLed: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: .zero)
        p.addLines([CGPoint(x: 0, y: 0), CGPoint(x: 14, y: 14),
                    CGPoint(x: 14, y: 14), CGPoint(x:14, y: 36),
                    CGPoint(x: 14, y: 36), CGPoint(x: 5, y: 44),
                    CGPoint(x: 5, y: 44), CGPoint(x: 0, y: 39),
                    CGPoint(x: 0, y: 39), CGPoint(x: 0, y: 0)])
        
        return p
    }
}
