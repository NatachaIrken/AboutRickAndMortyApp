//
//  CharactersViewModel.swift
//  AboutRickAndMorty
//
//  Created by Natacha Saldaña on 13-08-24.
//

import Foundation

class CharactersViewModel: ObservableObject {
	@Published var characterModel: RickAndMortyResponse?
	private let service: CharactersDataService = CharactersDataService()
		
	@MainActor
	func getCharacters() async {
		do {
			let result = await service.getCharactersList()
			
			switch result {
			case .success(let characterModel):
				self.characterModel = characterModel
			case .failure(_):
				CharactersApiError.invalidUrl
			}
		}
	}
}
