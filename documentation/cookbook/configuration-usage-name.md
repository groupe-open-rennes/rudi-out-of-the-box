# Comment personnaliser le nom de mon instance RUDI ROOB ?

_Cas d'usage_ : je souhaite remplacer le nom de l'instance de démonstration par le nom de ma propre instance RUDI.

## Modifier le nom de l'instance affiché dans le frontend

Modifier le fichier suivant : `config/konsult/customization.json`

Remplacer `Rudi out of Box` par le nom de votre instance dans toutes les occurrences du fichier.

Modifier le fichier `config/konsult/konsult.properties`

Remplacer les propriétés suivantes :
```properties
front.teamName=Roob
front.projectName=Roob
```

## Modifier le nom de l'instance et le nom de l'équipe dans les mails envoyés par RUDI

Modifier les propriétés suivantes :
* `rudi.bpmn.form.properties.team-name` : Nom qui apparaîtra dans les signatures des mails envoyés par RUDI
* `rudi.bpmn.form.properties.project-name` : Nom qui apparaîtra dans les objets des mails envoyés par RUDI
* `rudi.bpmn.form.properties.url-server` : URL qui apparaitra dans les signatures des mails envoyés par RUDI
* `rudi.bpmn.form.properties.url-contact` : URL de formulaire de contact qui apparaitra dans le texte des mails envoyés par RUDI

Les fichiers à modifier sont les suivants :
* `config/projekt/projekt.properties`
* `config/strukture/strukture.properties`
* `config/selfdata/selfdata.properties`
