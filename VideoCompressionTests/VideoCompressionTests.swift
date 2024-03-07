import XCTest
@testable import VideoCompression

final class VideoCompressionTests: XCTestCase {

    func testExample() async throws {
        let video = Bundle(for: VideoCompressionTests.self).url(forResource: "video", withExtension: ".mov")!
        let fileManager = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        
        await VideoEditor().export(url: video, outputDir: fileManager.appending(path: "temp.mov"))
    }
}
