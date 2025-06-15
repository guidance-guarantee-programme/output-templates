Feature: Welsh language summary document
  As a customer
  I want to receive my summary document in my native language
  So that I can digest it easily

Scenario: Receiving a Welsh language summary
  Given a customer has indicated they are Welsh speaking
  When we generate a summary document 
  Then the summary document is in Welsh
