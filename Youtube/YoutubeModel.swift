//
//  YoutubeModel.swift
//  Youtube
//
//  Created by SEVVAL on 1.11.2021.
//

import Foundation

struct YoutuberModel: Codable {
    let data: [Ders]

    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - Ders
struct Ders: Codable {
    let id: Int
    let icon: String
    let baslik, icerik: String
}
