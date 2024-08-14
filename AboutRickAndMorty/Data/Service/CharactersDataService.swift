//
//  DataService.swift
//  AboutRickAndMorty
//
//  Created by Natacha Saldaña on 13-08-24.
//

import Foundation

public class CharactersDataService {
	static let shared = CharactersDataService()
	let baseUrlString = BaseUrl()
	
	
	func getCharactersList() async -> Result<RickAndMortyResponse, CharactersApiError> {
		let urlString = baseUrlString.urlBase + baseUrlString.endPoint
		
		guard let url = URL(string: urlString) else {
			return .failure(.invalidUrl)
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			let decoder = JSONDecoder()
			let result = try decoder.decode(RickAndMortyResponse.self, from: data)
			return .success(result)
		} catch {
			return .failure(.invalidUrl)
		}
		return .failure(.invalidUrl)
	}
}

public enum CharactersApiError: Error
{
	case invalidUrl
	case badResponse(Int)
	case networkError(Error)
}
