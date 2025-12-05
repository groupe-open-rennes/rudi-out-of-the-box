# Comment personnaliser les logos utilisés dans mon instance RUDI ROOB ?

_Cas d'usage_ : je souhaite remplacer les logos de l'instance de démonstration par les logos de ma propre instance RUDI.

## Déposer les nouveaux logos

Les logos sont gérés par le microservice `konsult`.

Créer un dossier `mes_logos` dans le dossier `config/konsult`.

Déposer les nouveaux logos dans ce dossier, par exemple `logo_principal.png`, 

## Prise en compte des nouveaux logos 

Modifier le fichier `config/konsult/customization.json` pour indiquer les nouveaux noms de fichiers.

Exemple de `customization.json` :

```json
{
    ...
    "mainLogo": "/mes_logos/logo_principal.png",
	"mainLogoAltText": "Mon logo principal personnalisé",
    ...
}
```

Cette modification permet de remplacer le logo utiliser dans le coin supérieur gauche du header et son texte alternatif. 

Redémarrer le microservice `konsult` pour prendre en compte les modifications.

Faire de même pour les autres logos à personnaliser en modifiant les autres propriétés du fichier `customization.json`.

En particulier, le logo du footer peut être changé par la propriété suivante :

```	properties 
...
    "footerLogo": {
        "logo": "/mes_logos/logo_footer.png",
        "url": "https://rudi.fr",
        "logoAltText": "Logo bleu orange beta de rennes metropole"
    },
...
```