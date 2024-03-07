import XCTest
@testable import VideoCompression

final class VideoCompressionTests: XCTestCase {

    func testExample() async throws {
        let video = Bundle(for: VideoCompressionTests.self).url(forResource: "video", withExtension: ".mp4")!
        let fileManager = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        
        await VideoEditor().export(url: video, outputDir: fileManager.appending(path: "temp.mov"))
        await VideoEditor().export(url: fileManager.appending(path: "temp.mov"), outputDir: fileManager.appending(path: "temp2.mov"))
        await VideoEditor().export(url: fileManager.appending(path: "temp2.mov"), outputDir: fileManager.appending(path: "temp3.mov"))
        await VideoEditor().export(url: fileManager.appending(path: "temp3.mov"), outputDir: fileManager.appending(path: "temp4.mov"))
    }
}
