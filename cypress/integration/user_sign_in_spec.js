describe('User sign_in test', function() {
  it('A visitor can access to his user account', function() {
    cy.visit('https://e-commerce-stagings.herokuapp.com/')

    cy.contains('Se connecter').click()
    cy.get('#user_email')
      .type('tarek@gmail.com')
      .should('have.value', 'tarek@gmail.com')
    cy.get('#user_password')
      .type('azerty123')
      .should('have.value', 'azerty123')
    cy.get('[type="checkbox"]').check()
    cy.get('.btn').click()
  })
})
