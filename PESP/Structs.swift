//
//  Structs.swift
//  PESP
//
//  Created by Developer on 2/19/20.
//  Copyright © 2020 CarlosQuiroga. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
// https://app.quicktype.io
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code: String
    let alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region: Region
    let subregion: String
    let population: Int
    let latlng: [Double]
    let demonym: String
    let area: Double?
    let gini: Double?
    let timezones: [String]
    let borders: [String]
    let nativeName: String
    let numericCode: String?
    let currencies: [Currency]
    let languages: [Language]
    let translations: Translations
    let flag: String?
    let regionalBlocs: [RegionalBloc]
    let cioc: String?
}

// MARK: - Currency
struct Currency: Codable {
    let code: String?
    let name: String?
    let symbol: String?
}

// MARK: - Language
struct Language: Codable {
    let iso6391: String?
    let iso6392: String
    let name: String
    let nativeName: String
    
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso639_1"
        case iso6392 = "iso639_2"
        case name = "name"
        case nativeName = "nativeName"
    }
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case asia = "Asia"
    case empty = ""
    case europe = "Europe"
    case oceania = "Oceania"
    case polar = "Polar"
}

// MARK: - RegionalBloc
struct RegionalBloc: Codable {
    let acronym: Acronym
    let name: Name
    let otherAcronyms: [OtherAcronym]
    let otherNames: [OtherName]
}

enum Acronym: String, Codable {
    case al = "AL"
    case asean = "ASEAN"
    case au = "AU"
    case cais = "CAIS"
    case caricom = "CARICOM"
    case cefta = "CEFTA"
    case eeu = "EEU"
    case efta = "EFTA"
    case eu = "EU"
    case nafta = "NAFTA"
    case pa = "PA"
    case saarc = "SAARC"
    case usan = "USAN"
}

enum Name: String, Codable {
    case africanUnion = "African Union"
    case arabLeague = "Arab League"
    case associationOfSoutheastAsianNations = "Association of Southeast Asian Nations"
    case caribbeanCommunity = "Caribbean Community"
    case centralAmericanIntegrationSystem = "Central American Integration System"
    case centralEuropeanFreeTradeAgreement = "Central European Free Trade Agreement"
    case eurasianEconomicUnion = "Eurasian Economic Union"
    case europeanFreeTradeAssociation = "European Free Trade Association"
    case europeanUnion = "European Union"
    case northAmericanFreeTradeAgreement = "North American Free Trade Agreement"
    case pacificAlliance = "Pacific Alliance"
    case southAsianAssociationForRegionalCooperation = "South Asian Association for Regional Cooperation"
    case unionOfSouthAmericanNations = "Union of South American Nations"
}

enum OtherAcronym: String, Codable {
    case eaeu = "EAEU"
    case sica = "SICA"
    case unasul = "UNASUL"
    case unasur = "UNASUR"
    case uzan = "UZAN"
}

enum OtherName: String, Codable {
    case accordDeLibreÉchangeNordAméricain = "Accord de Libre-échange Nord-Américain"
    case alianzaDelPacífico = "Alianza del Pacífico"
    case caribischeGemeenschap = "Caribische Gemeenschap"
    case communautéCaribéenne = "Communauté Caribéenne"
    case comunidadDelCaribe = "Comunidad del Caribe"
    case jāmiAtAdDuwalAlArabīyah = "Jāmiʻat ad-Duwal al-ʻArabīyah"
    case leagueOfArabStates = "League of Arab States"
    case sistemaDeLaIntegraciónCentroamericana = "Sistema de la Integración Centroamericana,"
    case southAmericanUnion = "South American Union"
    case tratadoDeLibreComercioDeAméricaDelNorte = "Tratado de Libre Comercio de América del Norte"
    case umojaWaAfrika = "Umoja wa Afrika"
    case unieVanZuidAmerikaanseNaties = "Unie van Zuid-Amerikaanse Naties"
    case unionAfricaine = "Union africaine"
    case uniãoAfricana = "União Africana"
    case uniãoDeNaçõesSulAmericanas = "União de Nações Sul-Americanas"
    case uniónAfricana = "Unión Africana"
    case uniónDeNacionesSuramericanas = "Unión de Naciones Suramericanas"
    case الاتحادالأفريقي = "الاتحاد الأفريقي"
    case جامعةالدولالعربية = "جامعة الدول العربية"
}

// MARK: - Translations
struct Translations: Codable {
    let de: String?
    let es: String?
    let fr: String?
    let ja: String?
    let it: String?
    let br: String
    let pt: String
    let nl: String?
    let hr: String?
    let fa: String
}

typealias Welcome = [WelcomeElement]

