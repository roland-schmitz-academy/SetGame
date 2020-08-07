//
//  Themes.swift
//  SetGame
//
//  Created by Roland Schmitz on 24.07.20.
//

import SwiftUI

struct Theme {
    let name: String
    let counts: ClosedRange<Int>
    let colors: [Color]
    let shapes: [AnyShape]
    let shadings: [Double]
}

let themes = [
    Theme(
        name: "Standard",
        counts: 1...3,
        colors: [.red, .green, .blue],
        shapes: [AnyShape(Diamond()), AnyShape(Rectangle()), AnyShape(Capsule())],
        shadings: [0, 0.5, 1.0]
    ),
    Theme(
        name: "Beginner",
        counts: 1...3,
        colors: [.blue],
        shapes: [AnyShape(Circle()), AnyShape(Rectangle().aspectRatio(1)), AnyShape(Diamond().aspectRatio(1))],
        shadings: [0, 0.5, 1.0]
    ),
    Theme(
        name: "Orange Circles",
        counts: 1...3,
        colors: [.orange],
        shapes: [AnyShape(Circle())],
        shadings: [0, 0.5, 1.0]
    ),
    Theme(
        name: "Purple Pairs",
        counts: 2...2,
        colors: [.purple],
        shapes: [AnyShape(Circle()), AnyShape(Rectangle().aspectRatio(1)), AnyShape(Diamond().aspectRatio(1))],
        shadings: [0, 0.5, 1.0]
    ),
    Theme(
        name: "Many Pink Shapes",
        counts: 2...2,
        colors: [.pink],
        shapes: [AnyShape(Circle()), AnyShape(Rectangle()), AnyShape(Rectangle().aspectRatio(1)), AnyShape(Diamond().aspectRatio(1)), AnyShape(Diamond()), AnyShape(Ellipse())],
        shadings: [0, 0.5, 1.0]
    ),
    Theme(
        name: "5 Shades of Grey",
        counts: 2...2,
        colors: [.gray],
        shapes: [AnyShape(Circle()), AnyShape(Rectangle().aspectRatio(1)), AnyShape(Diamond().aspectRatio(1))],
        shadings: [0, 0.25, 0.5, 0.75, 1.0]
    ),
    Theme(
        name: "Raspberry Pies",
        counts: 1...3,
        // https://en.wikipedia.org/wiki/Raspberry_(color)
        colors: [Color(red: 227/255, green: 11/255, blue: 92/255)],
        shapes: [AnyShape(Pie(startAngle: .degrees(0), endAngle: .degrees(72))), AnyShape(Pie(startAngle: .degrees(0+120), endAngle: .degrees(72+120))), AnyShape(Pie(startAngle: .degrees(0+120*2), endAngle: .degrees(72+120*2)))],
        shadings: [0, 0.5, 1.0]
    )
]

