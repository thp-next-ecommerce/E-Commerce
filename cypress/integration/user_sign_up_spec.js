describe('User sign_up test', function() {
  it('A visitor can create a user account', function() {
    cy.visit('https://e-commerce-stagings.herokuapp.com/')

    cy.contains("S'inscrire").click()
    cy.get('#user_email')
      .type('tarek@gmail.com')
      .should('have.value', 'tarek@gmail.com')
    cy.get('#user_password')
      .type('azerty123')
      .should('have.value', 'azerty123')
    cy.get('#user_password_confirmation')
      .type('azerty123')
      .should('have.value', 'azerty123')

    cy.get('.btn').click()
  })
})
