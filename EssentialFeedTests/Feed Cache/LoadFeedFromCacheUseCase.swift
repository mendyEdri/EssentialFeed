//
//  LoadFeedFromCacheUseCase.swift
//  EssentialFeedTests
//
//  Created by Mendy Edri on 15/11/2019.
//  Copyright © 2019 CWT. All rights reserved.
//

import XCTest
import EssentialFeed

class LoadFeedFromCacheUseCase: XCTestCase {

    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
        
    func test_load_requestLoadsCacheRetrival() {
        let (sut, store) = makeSUT()
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrive])
    }
    
    func test_load_failsOnCacheRetrivalError() {
        let (sut, store) = makeSUT()
        let exp = expectation(description: "Wait for load completion")
        let retrivalError = anyNSError()
        
        var capturedError: Error?
        sut.load { error in
            capturedError = error
            exp.fulfill()
        }
        
        store.completeRetrival(with: retrivalError)
        
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(capturedError as NSError?, retrivalError)
    }

    // MARK: - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        
        trackMemoryLeaks(store, file: file, line: line)
        trackMemoryLeaks(sut, file: file, line: line)
        
        return (sut, store)
    }
    
    private func anyNSError() -> NSError {
        return NSError(domain: "any domain", code: 0)
    }
}
