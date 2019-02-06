describe('Admin sign_up test', function() {
  it('A visitor can create an admin account', function() {
    cy.visit('https://e-commerce-stagings.herokuapp.com/')

    cy.get('.footer-text').contains("S'inscrire").click()
    cy.get('#admin_email')
      .type('admin@gmail.com')
      .should('have.value', 'admin@gmail.com')
    cy.get('#admin_password')
      .type('azerty123')
      .should('have.value', 'azerty123')
    cy.get('#admin_password_confirmation')
      .type('azerty123')
      .should('have.value', 'azerty123')

    cy.get('.btn').click()
  })
})
