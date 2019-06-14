// swift-tools-version:4.2

import PackageDescription

let package = Package(
	name: "PerfectTemplate",
	products: [
		.executable(name: "PerfectTemplate", targets: ["PerfectTemplate"])
	],
	dependencies: [
		.package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
        //Request请求日志过滤器
        .package(url: "https://github.com/dabfleming/Perfect-RequestLogger.git", from: "0.2.0"),
        
        //将日志写入指定文件
        .package(url: "https://github.com/PerfectlySoft/Perfect-Logger.git", from: "3.0.2"),
        
        //MySql数据库依赖包
        .package(url: "https://github.com/PerfectlySoft/Perfect-MySQL.git", from: "3.4.1")
	],
	targets: [
		.target(name: "PerfectTemplate", dependencies: ["PerfectHTTPServer"])
	]
)
