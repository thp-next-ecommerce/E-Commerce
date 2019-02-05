describe('User sign_up test', function() {
  it('A visitor can create an account', function() {
    cy.visit('https://e-commerce-stagings.herokuapp.com/')

    cy.contains("S'inscrire").click()
    cy.get('#user_email')
      .type('fake@email.com')
      .should('have.value', 'fake@email.com')
    cy.get('#user_password')
      .type('azerty123')
      .should('have.value', 'azerty123')
    cy.get('#user_password_confirmation')
      .type('azerty123')
      .should('have.value', 'azerty123')

    cy.get('.btn').click()
  })
})
