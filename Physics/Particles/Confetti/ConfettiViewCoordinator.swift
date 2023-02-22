//
//  ConfettiViewCoordinator.swift
//  flagEmojiQuiz
//
//  Created by Hal Rushton on 1/25/23.
//

import SwiftUI

class ConfettiViewCoordinator {
    
    let viewModel: ConfettiViewModel
    
    init(viewModel: ConfettiViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - ViewCoordinator

extension ConfettiViewCoordinator {
    @ViewBuilder func start() -> some View {
        ConfettiView(viewModel: viewModel, coordinator: self)
    }
}
