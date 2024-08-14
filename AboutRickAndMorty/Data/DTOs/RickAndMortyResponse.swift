//
//  CharactersDTO.swift
//  AboutRickAndMorty
//
//  Created by Natacha Saldaña on 13-08-24.
//

import Foundation

struct RickAndMortyResponse: Codable {
	let info: Info
	let results: [CharactersDTO]
}

struct Info: Codable {
	let count: Int?
	let pages: Int?
	let next: String?
	let prev: String?
}

struct CharactersDTO: Codable {
	let id: Int
	let name: String?
	let status: String?
	let species: String?
	let type: String?
	let gender: String?
	let origin: Location
	let location: Location
	let image: String
	let episode: [String]
	let url: String
	let created: String?
}

struct Location: Codable {
	let name: String
	let url: String
}
