//
//  ContentView.swift
//  AboutRickAndMorty
//
//  Created by Natacha Saldaña on 13-08-24.
//

import SwiftUI

struct ContentView: View {
	@StateObject var viewModel = CharactersViewModel()
	
	var body: some View {
		
		NavigationStack {
			VStack {
				
				if let characters = viewModel.characterModel?.results {
					List(characters, id: \.id) { character in
						
						Text(character.name ?? "")
							.font(.callout)
							.scaledToFit()
						VStack {
							if let url = URL(string: character.image) {
								AsyncImage(url: url) { img in
									img.image?.resizable()
										.scaledToFit()
										.clipShape(.capsule)
								}
							}
						}
					}
				}
			}
		}
		
		.onAppear {
			Task {
				await viewModel.getCharacters()
			}
		}
	}
}

#Preview {
	ContentView()
}
