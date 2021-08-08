//
//  ServiceAssembly.swift
//  UIBank
//
//  Created by Silence on 25.07.2021.
//

import EasyDi

class Services1Assembly: Assembly {
    var service1: Service1 {
        define(init: Service1Impl())
    }
}
