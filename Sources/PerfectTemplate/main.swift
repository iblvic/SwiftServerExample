//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
server.documentRoot = "/Users/haosimac/Desktop/work/LHServerDemo/PerfectTemplate/webroot"
server.serverPort = 8181

// An example request handler.
// This 'handler' function can be referenced directly in the configuration below.
//func handler(request: HTTPRequest, response: HTTPResponse) {
//    // Respond with a simple message.
//    response.setHeader(.contentType, value: "text/html")
//    response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
//    // Ensure that response.completed() is called when your processing is done.
//    response.completed()
//}

// Configure one server which:
//    * Serves the hello world message at <host>:<port>/
//    * Serves static files out of the "./webroot"
//        directory (which must be located in the current working directory).
//    * Performs content compression on outgoing data when appropriate.
//var routes = Routes()
//routes.add(method: .get, uri: "/", handler: handler)
//routes.add(method: .get, uri: "/**",
//           handler: StaticFileHandler(documentRoot: "./webroot", allowResponseFilters: true).handleRequest)
//try HTTPServer.launch(name: "localhost",
//                      port: 8181,
//                      routes: routes,
//                      responseFilters: [
//                        (PerfectHTTPServer.HTTPFilter.contentCompression(data: [:]), HTTPFilterPriority.high)])

var routes = Routes()
let meta = "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n"
// MARK: - 静态路由路径
routes.add(method: .get, uri: "/login") { (request, response) in
    response.setHeader(.contentType, value: "text/html")
    response.setBody(string: meta)
    response.appendBody(string: "我是login路径返回的信息")
    response.completed()
}
routes.add(method: .post, uri: "/login") { (request, response) in
    
    response.setHeader(.contentType, value: "text/html")
    response.setBody(string: meta)
    
    guard let userName = request.param(name: "userName") else {
        return
    }
    
    guard let password = request.param(name: "password") else {
        return
    }
    
    let responseDict: [String: Any] = ["responseBody": ["userName": userName, "paswword": password], "result": "success", "resultMessage": "请求成功"]
    do {
        let json = try responseDict.jsonEncodedString()
        response.appendBody(string: json)
    } catch {
        response.appendBody(string: "json转换错误")
    }
    response.completed()
}
// MARK: - 路由变量
let valueKey = "key"
routes.add(method: .get, uri: "path/{\(valueKey)}/detail") { (request, response) in
    response.setHeader(.contentType, value: "text/html")
    response.setBody(string: meta)
    response.appendBody(string: "该URL路由变量为：\(request.urlVariables[valueKey]!)")
    response.completed()
}

// MARK: - 路由通配符
routes.add(method: .get, uri: "path/*/detail.html") { (request, response) in
    response.setHeader(.contentType, value: "text/html")
    response.setBody(string: meta)
    response.appendBody(string: "该URL为：\(request.path)")
    response.completed()
}

// MARK: - 结尾通配符
routes.add(method: .get, uri: "path/**") { (request, response) in
    response.setHeader(.contentType, value: "text/html")
    response.setBody(string: meta)
    response.appendBody(string: "该URL中的结尾通配符对应的变量：\(request.urlVariables[routeTrailingWildcardKey]!)")
    response.completed()
}
// 路由变量 > 静态路由 > 通配符路径 > 结尾通配符
server.addRoutes(routes)
do {
    // Launch the HTTP server.
    try server.start()
} catch {
    
}
