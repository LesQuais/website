---
layout: "item"
title: "Exemple"
size: "1337,42"
color: "rgb(125, 127, 122)"
---

En haut, une description de la symbolique associée au terme choisi.

{% include separator.html %}

Ici, une description du navire.

Ceci est un titre
-----------------

Ceci est un paragraphe.

Un autre titre
--------------

Un autre paragraphe, cette fois-ci avec un diaporama.

{% diaporama illustrations 1 %}
nom de fichier.png : Ceci est la légende associée à l'image fournie dans le dossier images/diaporamas/exemple/illustrations 1/nom de fichier.png
marble of doom.png : Ce qui apparaît trop souvent
{% enddiaporama %}

Un diaporama est donc constitué d'un dossier contenant des images, dans le dossier `images/diaporamas/`. Pour le faire apparaître dans une page, on doit donner le nom du dossier dans une balise `diaporama`. On peut ensuite associer des légendes aux images en donnant leur nom, deux points, et la légende. On clôt enfin le diaporama par la balise `enddiaporama`.

**Attention, une légende ne doit pas contenir de deux points !**
