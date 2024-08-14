//
//  CharactersView.swift
//  AboutRickAndMorty
//
//  Created by Natacha Saldaña on 13-08-24.
//

import Foundation
import SwiftUI

struct CharactersView: View {
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
