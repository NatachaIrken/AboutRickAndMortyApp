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
			if let characters = viewModel.characterModel?.results {
				List(characters, id: \.id) { character in
					
					Text(character.name ?? "hola")
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
