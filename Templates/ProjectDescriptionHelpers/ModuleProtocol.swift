//
//  ModuleProtocol.swift
//  Templates
//
//  Created by 박기석 on 10/28/24.
//

import ProjectDescription

public protocol ModuleProtocol {
    /// 모듈 이름
    var name: String { get }
    /// 모듈 타입
    var product: Product { get }
    /// 모듈 기본 경로 String 설정
    var defaultPath: String { get }
    /// 모듈 Bundle Identifier 설정
    var bundleId: String { get }
    /// 모듈 info.plist 설정
    var infoPlist: InfoPlist { get }
    /// 모듈 Source 코드 파일 or 경로 목록
    var sources: SourceFilesList { get }
    /// 모듈 예외 Source 코드 파일 or 경로 목록
    var excludingSources: [Path] { get }
    /// 모듈 Resource 파일 or 경로 목록
    var resources: ResourceFileElements? { get }
    /// 모듈 예외 Resource 파일 or 경로 목록
    var excludingResources: [Path] { get }
    /// 모듈 스크립트 목록
    var scripts: [TargetScript] { get }
    /// 의존성 설정
    var dependencies: [TargetDependency] { get }
    /// 모듈 빌드 Setting
    var settings: Settings? { get }
    /// 모듈 스킴 환경변수 설정
    var environmentVariables: [String : EnvironmentVariable] { get }
    /// 모듈 스킴 실행 Arguments
    var launchArguments: [LaunchArgument] { get }
}

public extension ModuleProtocol where Self: RawRepresentable, RawValue == String {
    var name: String { rawValue }
    var defaultPath: String { name }
    var bundleId: String { DefaultBaseSettingConfig().organizationName }
    var infoPlist: ProjectDescription.InfoPlist { .file(path: .path(defaultPath)) }
    var sources: SourceFilesList { [.glob(.path(defaultPath + "/Sources/**"), excluding: excludingSources)] }
    var excludingSources: [Path] { [] }
    var resources: ResourceFileElements? {
        guard product != .unitTests else { return [] }
        
        return [.glob(pattern: .path(defaultPath + "/Resources/**"), excluding: excludingResources)]
    }
    var excludingResources: [Path] { [] }
    var scripts: [TargetScript] { [] }
    var settings: Settings? {
        .settings(base: base, defaultSettings: .none)
    }
    var environmentVariables: [String : EnvironmentVariable] { [:] }
    var launchArguments: [LaunchArgument] { [] }
}

extension ModuleProtocol {
    private var base: SettingsDictionary {
        ["SWIFT_VERSION": "5.0",
         "IPHONEOS_DEPLOYMENT_TARGET": .string(DefaultBaseSettingConfig().iOSVersion)]
    }
}
