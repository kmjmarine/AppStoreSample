//
//  Feature.swift
//  AppStoreSample
//
//  Created by kmjmarine on 2022/01/29.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
