//
//  ContactScreenManagerTests.swift
//  HT1Tests
//
//  Created by Dmitriy Matveev on 12.10.23.
//
import XCTest

final class ContactScreenManagerTests: XCTestCase {
    var contactScreenManager: ContactScreenManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        contactScreenManager = ContactScreenManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        // in my case all autogen, only check initial size = 5
        XCTAssertEqual(contactScreenManager.contacts.count, 5)
    }

    func testAdd() throws {
        // given
        // when
        contactScreenManager.create(newContact: TestData.addContact)
        // then
        XCTAssertEqual(contactScreenManager.contacts.count, 6)
        XCTAssertEqual(contactScreenManager.contacts.last, TestData.addContact)
    }

    func testInitFav() throws {
        XCTAssertEqual(contactScreenManager.favourites.count, 0)
    }

    func testgenerateContacts() throws {
        // given
        // when
        // then
        XCTAssertEqual(ContactScreenManager.generateContacts(n: 5).count, 5)
        //default value for isBlocked == false
        XCTAssertEqual(ContactScreenManager.generateContacts(n: 1).first?.isAccountBlocked, false)
    }

    func testSave() throws {
        // given
        let firstContactToCompare = contactScreenManager.contacts.first
        var firstContactChanged = contactScreenManager.contacts.first
        // when
        firstContactChanged?.firstName = "Test1"
        firstContactChanged?.secondName = "Test2"
        contactScreenManager.save(contact: firstContactChanged!)
        // then
        XCTAssert(firstContactToCompare?.firstName != firstContactChanged?.firstName)
        XCTAssert(firstContactToCompare?.secondName != firstContactChanged?.secondName)
        XCTAssert(firstContactToCompare?.phoneNumber == firstContactChanged?.phoneNumber)
        XCTAssert(firstContactToCompare?.id == firstContactChanged?.id)
        XCTAssert(firstContactToCompare?.imageName == firstContactChanged?.imageName)
    }

    func testDeleteContact() throws {
        // given
        let firstContactToDelete = contactScreenManager.contacts.first!
        // when
        contactScreenManager.deleteContact(contactToDelete: firstContactToDelete)
        // then
        XCTAssert(!contactScreenManager.contacts.contains(firstContactToDelete))
    }

    func testGetContactByID() throws {
        // given
        let firstContactToRetrieve = contactScreenManager.contacts.first!
        // when
        let retrievedContact = contactScreenManager.getContactByID(id: firstContactToRetrieve.id)
        // then
        XCTAssert(firstContactToRetrieve == retrievedContact)
    }

    func testAddToFavourites() throws {
        // given
        let contactToAdd = contactScreenManager.contacts.first!
        XCTAssert(contactScreenManager.favourites.count == 0)
        // when
        contactScreenManager.addToFavourites(toFavourites: contactToAdd)
        // then
        XCTAssert(contactScreenManager.favourites.count == 1)
        XCTAssert(contactScreenManager.favourites.contains(contactToAdd.id))
    }

    func testUnfavoure() throws {
        // given
        XCTAssert(contactScreenManager.favourites.count == 0)
        // when
        contactScreenManager.addToFavourites(toFavourites: contactScreenManager.contacts.first!)
        XCTAssert(contactScreenManager.favourites.count == 1)
        // then
        // contactScreenManager.unfavoure(indexSet: <#T##IndexSet#>)
    }

    func testChangeStateLock() throws {
        // given
        // when
        // then
    }

func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}

private extension ContactScreenManagerTests {
    enum TestData {
        static let addContact =
            ContactModel(
                id: UUID(),
                firstName: "Thomas",
                secondName: "Anderson",
                phoneNumber: "+49 (000) 630-55555",
                imageName: "1",
                isAccountBlocked: false
            )
    }
}

