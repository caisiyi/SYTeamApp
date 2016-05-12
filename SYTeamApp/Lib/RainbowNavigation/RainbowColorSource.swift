//
//  LLRainbowColorSource.swift
//  Pods
//
//  Created by Danis on 15/11/25.
//
//
import UIKit
@objc public protocol RainbowColorSource {
    optional func navigationBarInColor() -> UIColor
    optional func navigationBarOutColor() -> UIColor
}
