Feature: Configuration

  Scenario: [default-configuration] En tant qu'utilisateur je peux utiliser la configuration par défaut
    Given En tant qu'utilisateur
    When Quand je ne précise pas de configuration
    Then Une configuration par défaut est appliquée

  Scenario: [local-configuration] En tant qu'utilisateur je peux modifier la configuration de la commande de rapport
    Given: En tant qu'utilisateur
    When: Quand je modifie des paramètres de configuration
    Then: les valeurs fournies remplacent les valeurs précédentes de la configuration