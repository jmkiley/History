//
//  ModelData.swift
//  History
//
//  Created by Stuart Hearn on 06/08/2015.
//  Copyright (c) 2015 Cleverlink Ltd. All rights reserved.
//
// TODO: This is a TEST model ONLY

import UIKit

struct ModelData {
    let summary: String
    let description: String
    let imageName: String
    let backgroundColor: UIColor
    let showEffects: Bool
}

let anubis = ModelData(summary: "Anubis", description: "Anubis wall art", imageName: "Anubis.jpg", backgroundColor: UIColor.redColor(), showEffects: true)
let sphinx = ModelData(summary: "Sphinx", description: "Sunset", imageName: "Sphinx.jpg", backgroundColor: UIColor.redColor(), showEffects: true)
let tut = ModelData(summary: "Tut", description: "Death mask", imageName: "Tut.jpg", backgroundColor: UIColor.redColor(), showEffects: true)
let pyramids = ModelData(summary: "Pyramids", description: "Giza pyramids", imageName: "Pyramids.jpg", backgroundColor: UIColor.redColor(), showEffects: true)
