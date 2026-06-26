describe('Google Test', () => {

    it('Visits Google', () => {

        cy.visit('https://google.com')

        cy.contains('Google')

    })

})