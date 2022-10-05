//
//  MiddlewareLogger.swift
//  ReSwiftMiddlewareTests
//
//  Created by Victor Carvalho Tavernari on 01/12/18.
//  Copyright © 2018 Tavernapps Mobile. All rights reserved.
//

import Foundation
import ReSwift
@testable import ReSwiftMiddleware

struct MiddlewareLogger: MiddlewareExecutor {

    let logger: LogConsole

    init(logger: LogConsole) {
        self.logger = logger
    }

    func execute(action: Action, getState: @escaping () -> Any?, dispatch: @escaping DispatchFunction) -> Action? {

        if let counterAction = action as? CounterActions {
            self.logger.register(value: counterAction.toString())
        }

        return action
    }
}
