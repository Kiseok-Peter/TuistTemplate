//
//  Target+Template.swift
//  TuistTemplate
//
//  Created by kiseok.park on 12/6/23.
//

import ProjectDescription

extension Target {
    /**
     타겟 간소화 생성자
     
     - Parameters:
        - name: 타겟 이름 설정.
        - platform: 타겟에서 지원되는 배포 대상 설정. default iOS
        - product: 타겟 product 설정. (ex: app, unitTest, framework 등...)
        - deploymentTargets: 타겟 deployment 최소 버전. default: .iOS("15.0")
        - infoPlist: info.plist 설정
        - sources: 소스 경로 설정
        - resources: 리소스 경로 설정
        - scripts: 스크립트 설정
        - dependencies: 의존성 설정
        - settings: 세팅 설정
     */
    public init(name: String,
                destinations: Destinations = [.iPhone],
                product: Product,
                bundleName: String,
                deploymentTargets: DeploymentTargets = .iOS("15.0"),
                infoPlist: InfoPlist = .default,
                sources: SourceFilesList,
                resources: ResourceFileElements? = nil,
                scripts: [TargetScript] = [],
                dependencies: [TargetDependency] = [],
                settings: Settings? = nil) {
        self = Target.target(name: name, // 타겟 이름 설정
                             destinations: destinations, // 타겟에서 지원되는 배포 대상 설정
                             product: product, // 타겟 product 설정 (ex: app, unitTest, framework 등...)
                             bundleId: "\(bundleName).\(name)", // Bundle ID
                             deploymentTargets: deploymentTargets, // 타겟 deployment 최소 버전.
                             infoPlist: infoPlist, // info.plist 설정
                             sources: sources, // 소스 경로 설정
                             resources: resources, // 리소스 경로 설정
                             scripts: scripts, // 스크립트 설정
                             dependencies: dependencies, // 의존성 설정
                             settings: settings) // 세팅 설정
    }
    
    /**
    Target 간소화 생성자
     
     - Parameters:
        - module: ModuleProtocol 내에 지정한 Module 정보
     */
    public init(with module: ModuleProtocol, config: BaseSettingConfigType? = nil) {
        self = Target.target(name: module.name, // 타겟 이름 설정
                             destinations: [.iPhone, .macWithiPadDesign, .appleVisionWithiPadDesign], // 타겟에서 지원되는 배포 대상 설정
                             product: module.product, // 타겟 product 설정 (ex: app, unitTest, framework 등...)
                             bundleId: module.bundleId, // Bundle ID
                             deploymentTargets: .iOS(config?.iOSVersion ?? DefaultBaseSettingConfig().iOSVersion), // 타겟 deployment 최소 버전.
                             infoPlist: module.infoPlist, // info.plist 설정
                             sources: module.sources, // 소스 경로 설정
                             resources: module.resources, // 리소스 경로 설정
                             scripts: module.scripts, // 스크립트 설정
                             dependencies: module.dependencies, // 의존성 설정
                             settings: module.settings, // 세팅 설정
                             environmentVariables: module.environmentVariables,
                             launchArguments: module.launchArguments)
    }
}
