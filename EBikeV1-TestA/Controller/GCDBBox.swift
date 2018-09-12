//
//  GCDBBox.swift
//  EBikeV1-TestA
//
//  Created 9/5/18.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
