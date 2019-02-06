describe('User add item to basket', function() {
  it('A user can add an item to his basket', function() {
    cy.visit('https://e-commerce-stagings.herokuapp.com/')

    cy.contains('Se connecter').click()
    cy.get('#user_email')
      .type('user@gmail.com')
      .should('have.value', 'user@gmail.com')
    cy.get('#user_password')
      .type('azerty123')
      .should('have.value', 'azerty123')
    cy.get('[type="checkbox"]').check()
    cy.get('.btn').click()

    cy.get('img').first().click()
    cy.contains('Ajouter au panier').click()
    cy.get('.basket-text').click()
  })
})
