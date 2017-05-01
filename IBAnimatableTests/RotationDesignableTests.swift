//
//  RotationDesignableTests.swift
//  IBAnimatable
//
//  Created by Steven on 4/30/17.
//  Copyright © 2017 IBAnimatable. All rights reserved.
//

import XCTest
@testable import IBAnimatable

class RotationDesignableTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testRotate() {
    helper_testRotate(element: AnimatableView())
    helper_testRotate(element: AnimatableScrollView())
    helper_testRotate(element: AnimatableImageView())
    helper_testRotate(element: AnimatableStackView())
    helper_testRotate(element: AnimatableLabel())
    helper_testRotate(element: AnimatableSlider())
  }

  private func helper_testRotate(element: MockRotationDesignable) {
    element.rotate = -360
    XCTAssertEqual(element.transform, .identity)
    element.rotate = 360
    XCTAssertEqual(element.transform, .identity)
    element.rotate = 90
    let mockTransform = CGAffineTransform(rotationAngle: .pi * 90 / 180)
    XCTAssertEqual(element.transform, mockTransform)
  }
}

// MARK: - MockRotationDesignable

protocol MockRotationDesignable: class, RotationDesignable {

  var transform: CGAffineTransform { get set }

}

// MARK: - Classes with RotationDesignable conformance

extension AnimatableView: MockRotationDesignable {}
extension AnimatableScrollView: MockRotationDesignable {}
extension AnimatableImageView: MockRotationDesignable {}
extension AnimatableStackView: MockRotationDesignable {}
extension AnimatableLabel: MockRotationDesignable {}
extension AnimatableSlider: MockRotationDesignable {}
