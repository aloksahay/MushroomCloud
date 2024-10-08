//
//  Web3Manager.swift
//  MintCondition
//
//  Created by Alok Sahay on 09.08.2024.
//

import Foundation
import Web3
import Web3PromiseKit
import Web3ContractABI
import BigInt

enum NetworkType {
    case baseTestnet
    case baseMainnet
    case optimismTestnet
    case optimismMainnet
    
}

struct Network {
    
    let name: String
    let rpcURL: String
    let explorerURL: String
    let type: NetworkType
    
    static let baseTestnet = Network(
        name: "Base Sepolia",
        rpcURL: "https://base-sepolia.g.alchemy.com/v2/",
        explorerURL: "https://basescan.org",
        type: .baseTestnet
    )
    
    static let baseMainnet = Network(
        name: "Base",
        rpcURL: "https://base-mainnet.g.alchemy.com/v2/",
        explorerURL: "https://basescan.org",
        type: .baseMainnet
    )
    
    static let optimism = Network(
        name: "Optimism",
        rpcURL: "https://opt-mainnet.g.alchemy.com/v2/",
        explorerURL: "https://optimistic.etherscan.io",
        type: .optimismMainnet
    )
    
    static let optimismTestnet = Network(
        name: "Optimism Sepolia",
        rpcURL: "https://opt-sepolia.g.alchemy.com/v2/",
        explorerURL: "https://optimistic.etherscan.io",
        type: .optimismTestnet
    )
}

class Web3Manager {
    
    static let sharedManager = Web3Manager()

    func getPvtKey() -> String? {
        if let privateKey = ProcessInfo.processInfo.environment["PRIVATE_KEY"] {
            return privateKey
        } else {
            return nil
        }
    }
    
    func getAlchemyAPIKey() -> String? {
        if let ApiKey = ProcessInfo.processInfo.environment["ALCHEMY_KEY"] {
            return ApiKey
        } else {
            return nil
        }
    }
    
    func getAllNetworks() -> [Network] {
        return [.baseMainnet,.baseTestnet,.optimism,.optimismTestnet]
    }
}
