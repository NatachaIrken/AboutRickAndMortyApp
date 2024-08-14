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
		ScrollView {
			
		}
		.onAppear {
			Task {
				await viewModel.getCharacters()
			}
			
		}
	}
}

//#Preview {
//    ContentView()
//}
