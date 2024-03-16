//
//  JobConfigurationSelections.swift
//  WrenchWizard
//
//  Created by Paris Makris on 15/3/24.
//

import Foundation

//@MainActor
//class JobConfigurationDataService {
//    
//    @Published var jobConfigurationTitles: [JobConfigurationTitle] = []
//    @Published var jobConfigurationSelections: [JobConfigurationSelection] = []
//
//    
//    init() {
//        
//    }
//    
//    func fetchTitles(_ id: Int){
//        Task{
//            guard let fetchedTitles: [JobConfigurationTitle] = await NetworkingManager.shared.downloadData(fromURL: "http://localhost:8080/getsubcategorytitles/\(id)") else { return }
//            jobConfigurationTitles = fetchedTitles
//        }
//    }
//    
//    func fetchSelections(_ id: Int){
//        Task{
//            guard let fetchedSelections: [JobConfigurationSelection] = await NetworkingManager.shared.downloadData(fromURL: "http://localhost:8080/gettitleselections/\(id)") else { return }
//            jobConfigurationSelections = fetchedSelections
//        }
//    }
//    
//}

class JobConfigurationDataService {
    @Published var jobConfigurationTitles: [JobConfigurationTitle] = []
    @Published var jobConfigurationSelections: [JobConfigurationSelection] = []
    
    init() {}
    
    func fetchTitles(_ id: Int) async throws -> [JobConfigurationTitle] {
        guard let fetchedTitles: [JobConfigurationTitle] = await NetworkingManager.shared.downloadData(fromURL: "http://localhost:8080/getsubcategorytitles/\(id)") else { throw NetworkError.badResponse }
        return fetchedTitles
    }
    
    func fetchSelections(_ id: Int) async throws -> [JobConfigurationSelection] {
        guard let fetchedSelections: [JobConfigurationSelection] = await NetworkingManager.shared.downloadData(fromURL: "http://localhost:8080/gettitleselections/\(id)") else { throw NetworkError.badResponse }
        return fetchedSelections
    }
    
    func fetchTitlesAndSelections(_ id: Int) async throws -> ([JobConfigurationTitle], [JobConfigurationSelection]) {
        let titles = try await fetchTitles(id)
        let selections = try await fetchSelections(id)
        return (titles, selections)
    }
}
