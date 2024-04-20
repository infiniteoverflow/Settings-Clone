//
//  SettingsHomeViewModel.swift
//  tableViewDemo
//
//  Created by Aswin Gopinathan on 20/04/24.
//

import Foundation

enum SettingsSectionType {
    case userAppleAccount
    case appleArcade
    case deviceNetwork
    case userNotification
    case general
    case payment
    case developer
}

class SettingsHomeViewModel {
    var sections: [SettingsSectionType] = [
        .userAppleAccount,
        .appleArcade,
        .deviceNetwork,
        .userNotification,
        .general,
        .payment,
        .developer
    ]
    
    func getSettingsModelListFromType(type: SettingsSectionType) -> [SettingsModel] {
        switch type {
        case .userAppleAccount:
            return []
        case .appleArcade:
            return [
                SettingsModel(text: "Apple Arcade Free for 3 Months")
            ]
        case .deviceNetwork:
            return [
                SettingsModel(text: "Airplane Mode",
                              switchShown: true,
                              image: "airplane"),
                SettingsModel(text: "Wifi",
                              image: "wifi"),
                SettingsModel(text: "Mobile Service",
                              image: "network"),
                SettingsModel(text: "Personal Hotspot",
                              image: "personalhotspot.circle.fill",
                              imageTintColor: .green)
                
            ]
        case .userNotification:
            return [
                SettingsModel(text: "Notifications",
                              image: "bell.badge",
                              imageTintColor: .red),
                SettingsModel(text: "Sounds & Haptics",
                              image: "speaker.wave.3.fill",
                              imageTintColor: .red),
                SettingsModel(text: "Focus",
                              image: "moon.fill",
                              imageTintColor: .purple),
                SettingsModel(text: "Screen Time",
                              image: "hourglass",
                              imageTintColor: .purple)
                
            ]
        case .general:
            return [
                SettingsModel(text: "General",
                              image: "gear",
                              imageTintColor: .gray),
                SettingsModel(text: "Control Center",
                              image: "switch.2",
                              imageTintColor: .gray),
                SettingsModel(text: "Display & Brightness",
                              image: "sun.max",
                              imageTintColor: .purple),
                SettingsModel(text: "Home Screen & App Library",
                              image: "building.columns",
                              imageTintColor: .orange),
                SettingsModel(text: "Accessibility",
                              image: "accessibility",
                              imageTintColor: .blue),
                SettingsModel(text: "Siri & Search",
                              image: "rectangle.and.text.magnifyingglass",
                              imageTintColor: .black),
                SettingsModel(text: "Face ID",
                              image: "faceid",
                              imageTintColor: .green),
                SettingsModel(text: "Emergency SOS",
                              image: "sos.circle",
                              imageTintColor: .red),
                SettingsModel(text: "Battery",
                              image: "battery.100percent",
                              imageTintColor: .green),
                SettingsModel(text: "Privacy & Security",
                              image: "hand.raised.fill",
                              imageTintColor: .blue)
            ]
        case .payment:
            return [
                SettingsModel(text: "App Store",
                              image: "storefront",
                              imageTintColor: .blue),
                SettingsModel(text: "Wallet",
                              image: "wallet.pass",
                              imageTintColor: .black)
            ]
        case .developer:
            return [
                SettingsModel(text: "Developer",
                              image: "hammer",
                              imageTintColor: .gray)
            ]
        }
    }
}
