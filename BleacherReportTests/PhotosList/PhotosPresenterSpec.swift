//
//  PhotosPresenterSpec.swift
//  BleacherReportTests
//
//  Created by Sylvan Ash on 20/11/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Nimble
import Quick
@testable import BleacherReport

class PhotosPresenterSpec: QuickSpec {

    override func spec() {
        var sut: PhotosPresenter!
        var view: PhotosViewSpy!
        var router: PhotosRouterSpy!
        var interactor: PhotosInteractorStub!

        beforeEach {
            view = PhotosViewSpy()
            router = PhotosRouterSpy()
            interactor = PhotosInteractorStub()
            sut = PhotosPresenter(view, interactor, router)
        }

        afterEach {
            view = nil
            router = nil
            interactor = nil
            sut = nil
        }

        describe("search") {
            context("text length is less than 3") {
                it("should not perform any search actions") {
                    // given
                    let searchText = "wi"

                    // when
                    sut.search(for: searchText)

                    // then
                    expect(interactor.didCallGetPhotos).to(equal(false))
                }
            }

            context("text length is greater than 2") {
                // given
                let searchText = "winter"

                context("success") {
                    it("should search for text and display results") {
                        // given
                        let numberOfItems = interactor.photos.count

                        // when
                        sut.search(for: searchText)

                        // then
                        expect(interactor.didCallGetPhotos).to(equal(true))
                        expect(interactor.searchText).to(equal(searchText))
                        expect(view.didCallReloadView).to(equal(true))
                        expect(sut.numberOfItems).to(equal(numberOfItems))
                    }
                }

                context("failed") {
                    it("should search for text and display error") {
                        // given
                        let errorTitle = "Error getting images"
                        let errorMessage = "Service currently unavailable"
                        let error = NSError.createError(withMessage: errorMessage)
                        interactor.error = error

                        // when
                        sut.search(for: searchText)

                        // then
                        expect(interactor.didCallGetPhotos).to(equal(true))
                        expect(interactor.searchText).to(equal(searchText))
                        expect(view.didCallShowError).to(equal(true))
                        expect(view.errorTitle).to(equal(errorTitle))
                        expect(view.errorMessage).to(equal(errorMessage))
                    }
                }
            }
        }
    }

}
