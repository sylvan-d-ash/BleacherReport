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

        describe("configure cell") {
            it("should pass correct data to cell") {
                // given
                let index = 0
                let photo = interactor.photos[index]
                let imageURL = URL(string: "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret)_t.jpg")!
                let cell = PhotoCellSpy()
                sut.search(for: "winter")

                // when
                sut.configure(cell, forRowAt: index)

                // then
                expect(cell.didCallDisplayTitle).to(equal(true))
                expect(cell.title).to(equal(photo.title))
                expect(cell.didCallDisplayImage).to(equal(true))
                expect(cell.imageURL).to(equal(imageURL))
            }
        }

        describe("didSelect") {
            it("should open full preview for selected photo") {
                // given
                let index = 0
                let photo = interactor.photos[index]
                sut.search(for: "winter")

                // when
                sut.didSelect(itemAt: index)

                // then
                expect(router.didCallShowFullPreview).to(equal(true))
                expect(router.photo).to(equal(photo))
            }
        }
    }

}


extension FlickrPhoto: Equatable {
    public static func ==(lhs: FlickrPhoto, rhs: FlickrPhoto) -> Bool {
        return (lhs.id == rhs.id) && (lhs.secret == rhs.secret)
    }
}
