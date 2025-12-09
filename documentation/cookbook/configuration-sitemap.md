# Comment modifier le contenu du sitemap de mon instance RUDI ROOB ?

_Cas d'usage_ : je souhaite personnaliser le sitemap de mon instance RUDI ROOB pour améliorer le référencement de mon site.

## Localisation du fichier sitemap.xml

Le fichier `sitemap.xml` est généré dynamiquement par le microservice `konsult` en fonction des contenus disponibles dans l'instance RUDI ROOB.

Cependant, il est possible de personnaliser le contenu du sitemap.

## Adaptation du robots.txt

Le fichier `robots.txt` indique aux moteurs de recherche où récupérer le contenu du sitemap.

Modifier le fichier `config/konsult/robots.txt` pour indiquer l'URL correcte du sitemap : par défaut, remplacer `localhost` par la valeur de votre `base_dn` dans le fichier `.env`.

```
Sitemap: http://rudi.<base_dn>/konsult/v1/sitemap/sitemap
```

## Personnalisation du contenu du sitemap
Pour personnaliser le contenu du sitemap, il est nécessaire de modifier le fichier de configuration du microservice `konsult`.

Créer le fichier `config/konsult/sitemap/sitemap.json` pour surcharger le contenu du fichier par défaut.

Contenu du fichier `sitemap.json` :

```json
{
	"maxUrlCount": 50000,
	"maxUrlSize": 2048,
	"staticSitemapEntries": {
		"urlList": [
			{
				"location": "/home",
				"isRelative": true
			},
			{
				"location": "/catalogue",
				"isRelative": true
			},
			{
				"location": "/projets",
				"isRelative": true
			},
			{
				"location": "/organization",
				"isRelative": true
			},
			{
				"location": "/login",
				"isRelative": true
			}
		]
	},
	"sitemapEntries": [
		{
			"type": "CMS"
		},
		{
			"type": "DATASETS"
		},
		{
			"type": "ORGANIZATIONS"
		},
		{
			"type": "PROJECTS"
		}
	]
}
```

Le fichier `sitemap.json` permet de définir 
* des entrées statiques (`staticSitemapEntries.urlList`) relatives à l'URL de base du site
* des entrées dynamiques, générées à partir des contenus RUDI ROOB
  * CMS : les pages créées dans Magnolia
  * DATASETS : les jeux de données publiés dans le catalogue
  * ORGANIZATIONS : les organisations validées référencées (non implémenté actuellement)
  * PROJECTS : les projets validés et publics référencés

Redémarrer le microservice `konsult` pour prendre en compte les modifications.

## Génération du sitemap

La génération du sitemap se fait à l'aide d'un token d'utilisateur ayant les droits d'administrateur (`rudi`)

```bash
curl --header "Authorization: Bearer <token>" --request POST --url http://rudi.<base_dn>/konsult/v1/sitemap
```

Le sitemap sera accessible à l'URL suivante : GET `http://rudi.<base_dn>/konsult/v1/sitemap/sitemap`
