//
//  TCANavigationApp.swift
//  TCANavigationApp
//
//  Created by 이재훈 on 9/25/24.
//

import ComposableArchitecture
import SwiftUI

@main
// Store를 집어넣는 방법 2가지
struct TCANavigationApp: App {
    // 1. 전역적으로 쓸 수 있는 방법 (앱 생명주기)
    static let stackBaseStore = Store(initialState: StackBaseFeature.State()) {
        StackBaseFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            // TreeBase (Presenting)
            // 2. 직접 집어넣는 방법 (뷰 생명주기)
            TreeBaseView(store: Store(initialState: TreeBaseFeature.State()) {
                TreeBaseFeature()
            })
            
            // StackBase (navigation)
            StackBaseView(store: TCANavigationApp.stackBaseStore)
        }
    }
}
